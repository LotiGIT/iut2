set schema 'sae_db';

/*             

                  Fonctions            
*/

-- calcul des jours facturables 
CREATE OR REPLACE FUNCTION calculer_jours_facturables(id_offre_input INT)
RETURNS TABLE (jour_facturable DATE) AS $$
BEGIN
    RETURN QUERY
    WITH changements AS (
        SELECT 
            id,
            id_offre,
            date_changement::DATE AS jour,
            MOD(id, 2) AS statut, -- Pair = en ligne (0), Impair = hors ligne (1)
            LEAD(date_changement::DATE, 1, CURRENT_DATE + 1) OVER (PARTITION BY id_offre ORDER BY date_changement) AS jour_suivant
        FROM _log_changement_status
        WHERE id_offre = id_offre_input
    ),
    jours_facturables AS (
        SELECT 
            generate_series(
                jour, 
                jour_suivant - 1, 
                '1 day'::INTERVAL
            )::DATE AS jour_facturable
        FROM changements
        WHERE statut = 0 -- Facture uniquement les jours où l'offre est en ligne
    )
    SELECT DISTINCT jour_facturable -- Éviter les doublons
    FROM jours_facturables
    WHERE jour_facturable <= CURRENT_DATE; -- Exclure les jours futurs
END;
$$ LANGUAGE plpgsql;


-- fonction qui permet uniquement à un membre de créer un avis.
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
        RAISE EXCEPTION 'Violation de la foreignn key: id_pro n existe pas dans _pro_prive ou _pro_public';
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


/*             

                  Triggers           
*/


-- trigger pour vérifier les id de la table activite
CREATE TRIGGER fk_activite_professionnel
BEFORE INSERT ON _activite
FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel();

-- trigger pour vérifier les id de la table spectacle
CREATE TRIGGER fk_spectacle_professionnel
BEFORE INSERT ON _spectacle
FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel();

-- trigger pour vérifier les id de la table visite
CREATE TRIGGER fk_visite_professionnel
BEFORE INSERT ON _visite
FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel();

-- trigger pour vérifier les id de la table parc d'attraction 
CREATE TRIGGER fk_parc_professionnel
BEFORE INSERT ON _parc_attraction
FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel();

-- trigger pour vérifier les id de la table restauration
CREATE TRIGGER fk_restauration_professionnel
BEFORE INSERT ON _restauration
FOR EACH ROW
EXECUTE FUNCTION fk_vers_professionnel();

-- trigger changement de statut
CREATE TRIGGER log_changement_statut
AFTER UPDATE ON _offre
FOR EACH ROW
WHEN (OLD.est_en_ligne IS DISTINCT FROM NEW.est_en_ligne)
EXECUTE FUNCTION trigger_log_changement_statut();

-- trigger pour la mise à jour de la date de mise à jour d'une offre
CREATE TRIGGER offer_update_timestamp
BEFORE UPDATE ON _offre
FOR EACH ROW
EXECUTE FUNCTION update_offer_timestamp();

-- trigger de vérification d'un unique compte professionnel privé puisse rentrer des valeurs (pas très explicit ça)
CREATE TRIGGER tg_unique_vals_compte_prive
BEFORE INSERT ON _pro_prive
FOR EACH ROW
EXECUTE FUNCTION unique_vals_compte();

-- trigger de vérification d'un unique compte professionnel publique puisse rentrer des valeurs (pas très explicit ça)
CREATE TRIGGER tg_unique_vals_compte_pro
BEFORE INSERT ON _pro_public
FOR EACH ROW
EXECUTE FUNCTION unique_vals_compte();

-- trigger de vérification d'un unique compte membre puisse rentrer des valeurs (pas très explicit ça)
CREATE TRIGGER tg_unique_vals_compte_membre
BEFORE INSERT ON _membre
FOR EACH ROW
EXECUTE FUNCTION unique_vals_compte();

-- trigger pour vérifier qu'un avis ne peut être écrit que par un membre
CREATE TRIGGER trigger_check_avis
BEFORE INSERT ON _avis
FOR EACH ROW
EXECUTE FUNCTION check_avis();

-- trigger pour vérifier qu'une réponse ne peut être écrite que par un pro détenteur de l'offre
CREATE TRIGGER trigger_check_reponse
BEFORE INSERT ON _reponses
FOR EACH ROW
EXECUTE FUNCTION check_reponse();


