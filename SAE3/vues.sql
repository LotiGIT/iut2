set schema 'sae_db';

-- Création vues de base

CREATE OR REPLACE VIEW sae_db.avis AS
SELECT * FROM sae_db._avis;

CREATE OR REPLACE VIEW sae_db.offre AS
SELECT * FROM sae_db._offre;

CREATE OR REPLACE VIEW sae_db.adresse AS
SELECT * FROM sae_db._adresse;

CREATE OR REPLACE VIEW sae_db.membre AS
SELECT * FROM sae_db._membre;

CREATE OR REPLACE VIEW sae_db.pro_prive AS
SELECT * FROM sae_db._pro_prive;

CREATE OR REPLACE VIEW sae_db.pro_public AS
SELECT * FROM sae_db._pro_public;

CREATE OR REPLACE VIEW sae_db.RIB AS
SELECT * FROM sae_db._RIB;

CREATE OR REPLACE VIEW sae_db.restauration AS
SELECT * FROM sae_db._restauration;

CREATE OR REPLACE VIEW sae_db.activite AS
SELECT * FROM sae_db._activite;

CREATE OR REPLACE VIEW sae_db.spectacle AS
SELECT * FROM sae_db._spectacle;

CREATE OR REPLACE VIEW sae_db.visite AS
SELECT * FROM sae_db._visite;

CREATE OR REPLACE VIEW sae_db.parc_attraction AS
SELECT * FROM sae_db._parc_attraction;

CREATE OR REPLACE VIEW sae_db.type_repas AS
SELECT * FROM sae_db._type_repas;

CREATE OR REPLACE VIEW sae_db.type_offre AS
SELECT * FROM sae_db._type_offre;

CREATE OR REPLACE VIEW sae_db.tarif_public AS
SELECT * FROM sae_db._tarif_public;










-- vue pour accéder à un compte pro mais sans voir son rib

CREATE VIEW vue_pro_prive_sans_rib AS
SELECT 
    pp.num_siren,
    a.ville,
    a.code_postal,
    c.email,
    c.num_tel
FROM 
    _pro_prive pp
JOIN 
    _compte c ON pp.id_compte = c.id_compte
JOIN 
    _adresse a ON c.id_adresse = a.id_adresse;
    

-- créer une vue des offres que les membres et visiteurs verront
CREATE VIEW vue_offres_publiques AS
SELECT 
    titre,
    description_offre,
    resume_offre,
    prix_mini,
    date_creation
FROM 
    _offre
WHERE 
    est_en_ligne = TRUE;  -- Seules les offres en ligne sont visibles publiquement


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


-- création de la vue permettant de voire les types d'offres 
CREATE OR REPLACE VIEW vue_offre_categorie AS
SELECT 
    o.id_offre,
    'restauration' AS type_offre
FROM _restauration o
UNION ALL
SELECT 
    o.id_offre,
    'parc_attraction' AS type_offre
FROM _parc_attraction o
UNION ALL
SELECT 
    o.id_offre,
    'visite' AS type_offre
FROM _visite o
UNION ALL
SELECT 
    o.id_offre,
    'activite' AS type_offre
FROM _activite o
UNION ALL
SELECT 
    o.id_offre,
    'spectacle' AS type_offre
FROM _spectacle o;


------------ vue type d'offre


create or replace view vue_offre_type as 
select id_offre, nom_type_offre
from _offre 
join _type_offre on  
_type_offre.id_type_offre = _offre.id_type_offre;

---------------- vue insertion d'une offre 


CREATE OR REPLACE VIEW sae_db.vue_creation_offre AS




CREATE OR REPLACE FUNCTION ftg_creation_offre() RETURNS TRIGGER AS $$
BEGIN

END;
$$ language 'plpgsql';


-- -------------------------------------------------------------------- Connexion Compte
-- -------------------------------------------------------------------- Déconnexion Compte


-- -------------------------------------------------------------------- Recherche Offre
-- -------------------------------------------------------------------- Tri Offre
-- -------------------------------------------------------------------- Filtres multicritères Offre 
-- -------------------------------------------------------------------- Mise à la une Offre
-- -------------------------------------------------------------------- Mise en relief Offre
-- -------------------------------------------------------------------- Facturation (générer PDF) 
-- -------------------------------------------------------------------- Vue 
-- -------------------------------------------------------------------- Vue 
 
