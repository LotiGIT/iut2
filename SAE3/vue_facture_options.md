# Vue

```sql
CREATE OR REPLACE VIEW vue_facture_options AS
SELECT
    f.numero AS "Numéro de Facture",
    f.designation AS "Désignation",
    f.date_emission AS "Date d'Émission",
    f.date_prestation AS "Date de Prestation",
    f.date_echeance AS "Date d'Échéance",
    o.nom AS "Nom de l'Option",
    s.nb_semaines AS "Durée Initiale (semaines)",
    GREATEST(s.nb_semaines, EXTRACT(WEEK FROM (CASE 
        -- Si l'option est annulée, calculer jusqu'au lundi suivant la date d'annulation
        WHEN o.date_annulation IS NOT NULL THEN
            o.date_annulation + (7 - EXTRACT(DOW FROM o.date_annulation))::INT
        -- Sinon, elle reste active pour la durée prévue
        ELSE s.date_lancement + (s.nb_semaines * 7)::INT
    END))) AS "Semaines Facturées",
    (GREATEST(s.nb_semaines, EXTRACT(WEEK FROM o.date_annulation)) * f.prix_unitaire_HT) AS "Total HT",
    (GREATEST(s.nb_semaines, EXTRACT(WEEK FROM o.date_annulation)) * f.prix_unitaire_TTC) AS "Total TTC"
FROM
    _facture f
JOIN
    _option o ON f.designation = o.nom
JOIN
    _offre_souscription_option osso ON osso.nom_option = o.nom
JOIN
    _souscription s ON s.id_souscription = osso.id_souscription;
```

## Explications 

GREATEST : 
- Compare la durée initiale d'activation de l'option (nb_semaines) avec la période jusqu'au lundi suivant la date d'annulation de l'option.
- Retient la plus grande valeur pour éviter la facturation inférieure aux semaines prévues.


s.nb_semaines : 
- Durée initiale de l'option en semaines


EXTRACT(WEEK FROM ...) :
- Extrait le numéro de semaine à partir d'une date

WHEN o.date_annulation IS NOT NULL :

- Si l'option est annulée, calcule la date du lundi suivant la date d'annulation.
- EXTRACT(DOW) renvoie le jour de la semaine (0 = Dimanche, 1 = Lundi...).
- 7 - EXTRACT(DOW FROM o.date_annulation) calcule le nombre de jours jusqu'au prochain lundi.

ELSE :

- Si l'option n'est pas annulée, utilise la date de lancement + nb semaines prévues.