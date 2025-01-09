set schema 'sae_db';

drop view vue_options_offres;
-- vue jours en ligne 
CREATE OR REPLACE VIEW vue_options_offres AS
SELECT 
    o.id_offre AS "Souscription de l'offre n°",
    s.id_souscription AS "Souscription n°",
    s.nb_semaines AS "Nombre de semaines de souscription",
    s.date_lancement AS "Lancement de la souscription",
    s.date_annulation AS "Date d'annulation de la souscription",
    opt.nom AS "Nom de l'option",
    opt.prix_ht AS "Prix Hors Taxe €",
    opt.prix_ttc AS "Prix Toute Charge Comprise €",
    opt.prix_unitaire AS "Prix Unitaire d'une Option"
    
FROM 
    _offre_souscription_option oso
JOIN 
    _souscription s ON oso.id_souscription = s.id_souscription
JOIN 
    _option opt ON oso.nom_option = opt.nom
JOIN 
    _offre o ON oso.id_offre = o.id_offre;
    
    
    
    

-- vue pour da la facture sans les montants totaux 
CREATE OR REPLACE VIEW vue_facture_quantite AS
SELECT 
    f.numero AS "Numéro de Facture",
    f.designation AS "Service",
    f.date_emission AS "Date d'Émission",
    f.date_prestation AS "Date de Prestation",
    f.date_echeance AS "Date d'Échéance",
    f.date_lancement AS "Date de Lancement",
    CASE
        -- Recherche des mots clés dans la désignation pour décider si c'est une option ou un abonnement
        WHEN LOWER(f.designation) LIKE '%abonnement%' THEN CONCAT(f.nbjours_abonnement, ' jours')
        WHEN LOWER(f.designation) LIKE '%option%' OR LOWER(f.designation) IN ('a la une', 'en relief') THEN CONCAT(f.quantite, ' semaines')
        ELSE 'Quantité inconnue'
    END AS "Quantité",
    f.prix_unitaire_HT AS "Prix Unitaire HT (€)",
    f.prix_unitaire_TTC AS "Prix Unitaire TTC (€)",
    f.quantite * f.prix_unitaire_HT AS "Montant HT (€)",
    f.quantite * f.prix_unitaire_TTC AS "Montant TTC (€)"
FROM _facture f;



-- vue de la facture avec les montants totaux 
CREATE OR REPLACE VIEW vue_facture_totaux AS
SELECT 
    numero AS "Numéro de Facture",
    SUM(quantite * prix_unitaire_HT) AS "Total HT (€)",
    SUM(quantite * prix_unitaire_TTC) AS "Total TTC (€)"
FROM _facture
GROUP BY numero;


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
    description,
    resume,
    prix_mini,
    date_creation
FROM 
    _offre
WHERE 
    est_en_ligne = TRUE;  -- Seules les offres en ligne sont visibles publiquement

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
select id_offre, nom
from _offre 
join _type_offre on  
_type_offre.id_type_offre = _offre.id_type_offre;

-- -------------------------------------------------------------------- Connexion Compte

CREATE OR REPLACE VIEW vue_connexion_compte AS
SELECT email, mdp_hash
FROM sae_db._compte;


-- -------------------------------------------------------------------- Recherche Offre
CREATE OR REPLACE VIEW sae_db.vue_recherche_offre AS
SELECT est_en_ligne, description, resume, prix_mini, titre, date_mise_a_jour, nom
FROM _offre 
INNER JOIN _type_offre
ON _offre.id_type_offre = _type_offre.id_type_offre;

-- -------------------------------------------------------------------- id compte affilié au compte

CREATE OR REPLACE VIEW vue_comptes AS
SELECT 
    m.id_compte AS id_compte,
    'Membre' AS type_compte,
    m.email,
    m.pseudo AS nom_ou_pseudo
FROM 
    _membre m

UNION ALL

SELECT 
    ppr.id_compte AS id_compte,
    'Professionnel Privé' AS type_compte,
    ppr.email,
    ppr.nom_pro AS nom_ou_pseudo
FROM 
    _pro_prive ppr

UNION ALL

SELECT 
    ppu.id_compte AS id_compte,
    'Professionnel Public' AS type_compte,
    ppu.email,
    ppu.nom_pro AS nom_ou_pseudo
FROM 
    _pro_public ppu;
-- -------------------------------------------------------------------- offre lié au pro
CREATE OR REPLACE VIEW vue_pro_offres AS
SELECT 
    ppr.id_compte AS id_pro,
    'Professionnel Privé' AS type_pro,
    ppr.nom_pro AS nom_pro,
    ppr.email AS email_pro,
    o.id_offre AS id_offre,
    o.titre AS titre_offre,
    o.description AS description_offre
FROM 
    _pro_prive ppr
JOIN 
    _offre o ON ppr.id_compte = o.id_pro

UNION ALL

SELECT 
    ppu.id_compte AS id_pro,
    'Professionnel Public' AS type_pro,
    ppu.nom_pro AS nom_pro,
    ppu.email AS email_pro,
    o.id_offre AS id_offre,
    o.titre AS titre_offre,
    o.description AS description_offre
FROM 
    _pro_public ppu
JOIN 
    _offre o ON ppu.id_compte = o.id_pro;

-- -------------------------------------------------------------------- Filtres multicritères Offre 
-- -------------------------------------------------------------------- Mise à la une Offre
-- -------------------------------------------------------------------- Mise en relief Offre
-- -------------------------------------------------------------------- Facturation (générer PDF) 
-- -------------------------------------------------------------------- Vue 
-- -------------------------------------------------------------------- Vue 
 
