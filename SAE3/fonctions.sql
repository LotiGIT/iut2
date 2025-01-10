set schema 'sae_db';

/*             
Fonctions            
*/

-- Fonction de comptage des likes et dislikes 

CREATE OR REPLACE FUNCTION update_reaction_counters()
RETURNS TRIGGER AS $$
BEGIN
    -- Ajouter un like
    IF NEW.reaction_type = TRUE THEN
        UPDATE _avis
        SET total_likes = total_likes + 1
        WHERE id = NEW.avis_id;
    ELSIF NEW.reaction_type = FALSE THEN
        UPDATE _avis
        SET total_dislikes = total_dislikes + 1
        WHERE id = NEW.avis_id;
    END IF;

    -- Supprimer une ancienne réaction si elle existe
    IF TG_OP = 'UPDATE' AND OLD.reaction_type IS NOT NULL THEN
        IF OLD.reaction_type = TRUE THEN
            UPDATE _avis
            SET total_likes = total_likes - 1
            WHERE id = OLD.avis_id;
        ELSE
            UPDATE _avis
            SET total_dislikes = total_dislikes - 1
            WHERE id = OLD.avis_id;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Vérification des règles métier (avis/réponses)

CREATE OR REPLACE FUNCTION check_contraintes_avis()
RETURNS TRIGGER AS $$
DECLARE
    auteur_offre INT;
    avis_reponse_offre INT;
    is_response BOOLEAN := (NEW.id_avis_reponse IS NOT NULL);
BEGIN
    -- Récupérer l'auteur de l'offre
    SELECT id_pro INTO auteur_offre
    FROM sae_db._offre
    WHERE id_offre = NEW.id_offre;

    -- Si l'avis est une réponse
    IF is_response THEN
        -- Vérifier que l'avis parent existe et récupérer son id_offre
        SELECT id_offre INTO avis_reponse_offre
        FROM sae_db._avis
        WHERE id_avis = NEW.id_avis_reponse;

        -- Vérifier que l'avis parent appartient à la même offre
        IF avis_reponse_offre IS DISTINCT FROM NEW.id_offre THEN
            RAISE EXCEPTION 'L''avis auquel vous répondez n''appartient pas à la même offre.';
        END IF;

        -- Vérifier que l'avis parent n'est pas une réponse lui-même
        IF EXISTS (SELECT 1 FROM _avis WHERE id_avis = NEW.id_avis_reponse AND id_avis_reponse IS NOT NULL) THEN
            RAISE EXCEPTION 'Vous ne pouvez pas répondre à une réponse.';
        END IF;

        -- Vérifier que l'auteur est un professionnel (auteur de l'offre)
        IF NEW.id_compte != auteur_offre THEN
            RAISE EXCEPTION 'Seul le professionnel peut répondre à un avis.';
        END IF;
    ELSE
        -- Sinon, c'est un avis initial
        -- Vérifier que l'auteur de l'avis n'est pas l'auteur de l'offre
        IF NEW.id_compte = auteur_offre THEN
            RAISE EXCEPTION 'Le professionnel ne peut pas laisser un avis sur sa propre offre.';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Vérification des clés étrangères avec les comptes et offres
CREATE OR REPLACE FUNCTION fk_avis()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérification de l'existence de l'utilisateur (id_compte)
    IF NOT EXISTS (SELECT 1 FROM  sae_db._pro_prive WHERE id_compte = NEW.id_compte)
    AND NOT EXISTS (SELECT 1 FROM sae_db._pro_public WHERE id_compte = NEW.id_compte)
    AND NOT EXISTS (SELECT 1 FROM sae_db._membre WHERE id_compte = NEW.id_compte)
    THEN
        RAISE EXCEPTION 'L''id_compte % ne correspond à aucun utilisateur valide.', NEW.id_compte;
    END IF;

    -- Vérification de l'existence de l'offre (id_offre)
    IF NOT EXISTS (SELECT 1 FROM sae_db._restauration WHERE id_offre = NEW.id_offre)
    AND NOT EXISTS (SELECT 1 FROM sae_db._activite WHERE id_offre = NEW.id_offre)
    AND NOT EXISTS (SELECT 1 FROM sae_db._parc_attraction WHERE id_offre = NEW.id_offre)
    AND NOT EXISTS (SELECT 1 FROM sae_db._visite WHERE id_offre = NEW.id_offre)
    AND NOT EXISTS (SELECT 1 FROM sae_db._spectacle WHERE id_offre = NEW.id_offre)
    THEN
        RAISE EXCEPTION 'L''id_offre % ne correspond à aucune offre valide.', NEW.id_offre;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- la prestation est créée par un pro et insérée dans la bdd, si un pro différent créé la même prestation alors la prestation est réutilisée et non créée.

CREATE OR REPLACE FUNCTION creer_prestation(
    p_nom VARCHAR(50),        -- Nom de la prestation
    p_inclus BOOLEAN,         -- Inclus ou non
    p_id_offre INTEGER        -- ID de l'offre liée à la prestation
)
RETURNS INTEGER AS $$
DECLARE
    prestation_existante_id INTEGER;
    new_prestation_id INTEGER;
BEGIN
    -- Vérifier si la prestation existe déjà dans la base de données (basée sur le nom)
    SELECT id_prestation
    INTO prestation_existante_id
    FROM _prestation
    WHERE nom = p_nom;

    -- Si la prestation existe déjà, on réutilise son ID
    IF prestation_existante_id IS NOT NULL THEN
        -- On ne fait rien de plus, car la prestation existe déjà
        RETURN prestation_existante_id;  -- Retourne l'ID de la prestation existante
    ELSE
        -- Sinon, on crée une nouvelle prestation
        INSERT INTO _prestation (nom, inclus, id_offre)
        VALUES (p_nom, p_inclus, p_id_offre)
        RETURNING id_prestation INTO new_prestation_id;

        -- Retourner l'ID de la nouvelle prestation
        RETURN new_prestation_id;
    END IF;
END;
$$ LANGUAGE plpgsql;



-- vérifie que l'email est valide
CREATE OR REPLACE FUNCTION verifier_email_connexion(email_input VARCHAR)
RETURNS TEXT AS $$
DECLARE
    email_count INT;
BEGIN
        -- Vérifier si l'email existe dans la table _compte
    SELECT COUNT(*) INTO email_count
    FROM _compte
    WHERE _compte.email = email_input;

    -- Si l'email existe
    IF email_count > 0 THEN
        RETURN 'Email valide et existant';
    ELSE
        RETURN 'Email non trouvé dans la base';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Mise à jour de automatique de la date de mise à jour des offres
CREATE OR REPLACE FUNCTION update_offer_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.date_mise_a_jour = CURRENT_DATE;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- mise à jour du statut 'en ligne' de l'offre
CREATE OR REPLACE FUNCTION trigger_log_changement_statut()
RETURNS TRIGGER AS $$
BEGIN
    -- Enregistrement de la date de changement de statut
    INSERT INTO _log_changement_status (id_offre, date_changement)
    VALUES (NEW.id_offre, CURRENT_DATE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Fonction pour vérifier une clé étrangère manuellement, car sinon pb avec raisons de double héritage
CREATE OR REPLACE FUNCTION fk_vers_professionnel() RETURNS TRIGGER AS $$
BEGIN
    -- Alerter quand la clé étrangère n'est pas respecté
    IF NOT EXISTS (SELECT 1 FROM sae_db._pro_prive WHERE id_compte = NEW.id_pro)
    AND NOT EXISTS (SELECT 1 FROM sae_db._pro_public WHERE id_compte = NEW.id_pro) THEN
        RAISE EXCEPTION 'Foreign key violation: id_pro does not exist in _pro_prive or _pro_public';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour vérifier que tous les comptes ont bien des identifiants différents (~priamry key & UNIQUE constraints perdues par inherits)
CREATE OR REPLACE FUNCTION unique_vals_compte() RETURNS TRIGGER AS $$
BEGIN
    -- Check pour l'id
    IF EXISTS (SELECT 1 FROM sae_db._compte WHERE email = NEW.email) THEN
        RAISE EXCEPTION 'Erreur : valeur dupliquée pour l''adresse email dans deux comptes différents';
    END IF;
    -- Check pour le mail
    IF EXISTS (SELECT 1 FROM sae_db._compte WHERE email = NEW.email) THEN
        RAISE EXCEPTION 'Erreur : valeur dupliquée pour l''adresse email dans deux comptes différents';
    END IF;
    -- Check pour le numero de tel
    IF EXISTS (SELECT 1 FROM sae_db._compte WHERE email = NEW.email) THEN
        RAISE EXCEPTION 'Erreur : valeur dupliquée pour l''adresse email dans deux comptes différents';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_fk_offre() RETURNS TRIGGER AS $$
BEGIN
    PERFORM * FROM sae_db._offre WHERE id_offre = NEW.id_offre;
    IF NOT FOUND THEN 
        RAISE EXCEPTION 'Foreign key violation: id_offre does not exist in _offre';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

 
 -- vue qui vérifie la validité de l'adresse mail
CREATE OR REPLACE FUNCTION verifier_email_connexion(email_input VARCHAR)
RETURNS TEXT AS $$
DECLARE
    email_count INT;
BEGIN
        -- Vérifier si l'email existe dans la table _compte
    SELECT COUNT(*) INTO email_count
    FROM _compte
    WHERE _compte.email = email_input;

    -- Si l'email existe
    IF email_count > 0 THEN
        RETURN 'Email valide et existant';
    ELSE
        RETURN 'Email non trouvé dans la base';
    END IF;
END;
$$ LANGUAGE plpgsql;


/*-- fonction qui permet uniquement à un membre de créer un avis.
CREATE OR REPLACE FUNCTION check_avis()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie que l'id_compte appartient à un membre
    IF NOT EXISTS (
        SELECT 1
        FROM _membre
        WHERE id_compte  = NEW.id_membre
    ) THEN
        RAISE EXCEPTION 'Seul un membre peut écrire un avis';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- fonction qui permet uniquement au professionnel détenteur de l'offre de répondre à un avis
CREATE OR REPLACE FUNCTION check_reponse()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie que le professionnel qui répond est bien le propriétaire de l'offre liée à l'avis
    IF NOT EXISTS (
        SELECT 1
        FROM sae_db._offre o
        JOIN sae_db._avis a ON o.id_offre = a.id_offre
        WHERE a.id_avis = NEW.id_avis AND o.id_pro = NEW.id_pro
    ) THEN
        RAISE EXCEPTION 'Seul le professionnel propriétaire de l''offre peut répondre à cet avis';
    END IF;
    RETURN NEW;
END;*/


/*             
Triggers           
*/

-- Trigger pour valider les règles métier
CREATE TRIGGER tg_check_contraintes_avis BEFORE
INSERT
    OR
UPDATE ON sae_db._avis FOR EACH ROW
EXECUTE FUNCTION check_contraintes_avis ();

-- Trigger pour valider les clés étrangères
CREATE TRIGGER tg_fk_avis BEFORE
INSERT
    ON sae_db._avis FOR EACH ROW
EXECUTE FUNCTION fk_avis ();

-- trigger pour vérifier les id de la table offre pour tarif_public
DROP TRIGGER IF EXISTS deferred_fk_offre_tarif_public ON _tarif_public;
CREATE CONSTRAINT TRIGGER deferred_fk_offre_tarif_public
AFTER INSERT OR UPDATE ON _tarif_public
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_fk_offre();

-- trigger pour vérifier les id de la table offre pour horaires
DROP TRIGGER IF EXISTS deferred_fk_offre_horaires ON sae_db._horaires;
CREATE CONSTRAINT TRIGGER deferred_fk_offre_horaires
AFTER INSERT OR UPDATE ON _horaire
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_fk_offre();

-- trigger pour vérifier les id de la table offre pour offre souscription option
DROP TRIGGER IF EXISTS deferred_fk_offre_souscription_option ON sae_db._offre_souscription_option;
CREATE CONSTRAINT TRIGGER deferred_fk_offre_souscription_option
AFTER INSERT OR UPDATE ON sae_db._offre_souscription_option
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_fk_offre();

-- trigger pour vérifier les id de la table offre pour tag offre
DROP TRIGGER IF EXISTS deferred_fk_offre_tag_offre ON sae_db._tag_offre;
CREATE CONSTRAINT TRIGGER deferred_fk_offre_tag_offre
AFTER INSERT OR UPDATE ON sae_db._tag_offre
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_fk_offre();

-- trigger pour vérifier les id de la table offre pour offre facture
DROP TRIGGER IF EXISTS deferred_fk_offre_facture ON sae_db._facture;
CREATE CONSTRAINT TRIGGER deferred_fk_offre_facture
AFTER INSERT OR UPDATE ON sae_db._facture
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_fk_offre();

-- trigger pour vérifier les id de la table offre pour offre log changement status
DROP TRIGGER IF EXISTS deferred_fk_offre_log_changement_status ON sae_db._log_changement_status;
CREATE CONSTRAINT TRIGGER deferred_fk_offre_log_changement_status
AFTER INSERT OR UPDATE ON sae_db._log_changement_status
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_fk_offre();


-- trigger pour vérifier les id de la table activite
CREATE OR REPLACE TRIGGER fk_activite_professionnel BEFORE
INSERT
    ON _activite FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel ();

-- trigger pour vérifier les id de la table spectacle
CREATE OR REPLACE TRIGGER fk_spectacle_professionnel BEFORE
INSERT
    ON _spectacle FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel ();

-- trigger pour vérifier les id de la table visite
CREATE OR REPLACE TRIGGER fk_visite_professionnel BEFORE
INSERT
    ON _visite FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel ();

-- trigger pour vérifier les id de la table parc d'attraction
CREATE OR REPLACE TRIGGER fk_parc_attraction_professionnel BEFORE
INSERT
    ON _parc_attraction FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel ();

-- trigger pour vérifier les id de la table restauration
CREATE OR REPLACE TRIGGER fk_restauration_professionnel BEFORE
INSERT
    ON _restauration FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel ();

-- trigger changement de statut
CREATE OR REPLACE TRIGGER log_changement_statut AFTER
UPDATE ON _offre FOR EACH ROW WHEN (
    OLD.est_en_ligne IS DISTINCT
    FROM NEW.est_en_ligne
)
EXECUTE FUNCTION trigger_log_changement_statut ();

-- trigger pour la mise à jour de la date de mise à jour d'une offre
CREATE OR REPLACE TRIGGER offer_update_timestamp BEFORE
UPDATE ON _offre FOR EACH ROW
EXECUTE FUNCTION update_offer_timestamp ();

-- triggers de vérification d'un unique compte professionnel privé puisse rentrer des valeurs (pas très explicit ça)
CREATE OR REPLACE TRIGGER tg_unique_vals_compte BEFORE
INSERT
    ON _pro_prive FOR EACH ROW
EXECUTE FUNCTION unique_vals_compte ();

-- triggers de vérification d'un unique compte professionnel publique puisse rentrer des valeurs (pas très explicit ça)
CREATE OR REPLACE TRIGGER tg_unique_vals_compte BEFORE
INSERT
    ON _pro_public FOR EACH ROW
EXECUTE FUNCTION unique_vals_compte ();

-- triggers de vérification d'un unique compte membre puisse rentrer des valeurs (pas très explicit ça)
CREATE OR REPLACE TRIGGER tg_unique_vals_compte BEFORE
INSERT
    ON _membre FOR EACH ROW
EXECUTE FUNCTION unique_vals_compte ();

-- trigger de comptage des réactions

CREATE TRIGGER trg_update_reaction_counters
AFTER INSERT OR UPDATE OR DELETE ON avis_reactions
FOR EACH ROW
EXECUTE FUNCTION update_reaction_counters();

/*-- trigger pour vérifier qu'un avis ne peut être écrit que par un membre
CREATE TRIGGER trigger_check_avis
BEFORE INSERT ON _avis
FOR EACH ROW
EXECUTE FUNCTION check_avis();

-- trigger pour vérifier qu'une réponse ne peut être écrite que par un pro détenteur de l'offre
CREATE TRIGGER trigger_check_reponse
BEFORE INSERT ON _reponses
FOR EACH ROW
EXECUTE FUNCTION check_reponse();*/
