## Les petits oublis qu'on pourrait rajouter lors de la présentation

Une signalétique particulière indique le type de l’Offre : Offre Gratuite, Standard, Premium. 

Des signalétiques particulières indiquent pour une Offre le nombre d’Avis :
    - Non encore consultés par le Professionnel 
    - Auxquels il n’a pas répondu (hors Avis non consultés)
    - "Blacklistés"
Ces signalétiques doivent lui permettre un accès direct aux Avis spécifiques à l’Offre.

Dans l'offre :
-  Les informations non visibles des Visiteurs doivent être clairement identifiables à l’écran.


## Grille tarifaire

Elle contient :
- tarif
- tarif minimum

## Facture

- facturation du nombre de jours "en ligne" lors du dernier mois.
- jours avant la création ne sont pas comptabilisés (logique)
- facturation d’une Offre remise « en ligne » est faite à partir du jour de remise « en ligne », ne pas facturer deux fois un même jour
- Options A LA UNE et EN RELIEF sont souscrites pour une durée multiple d’une semaine, sur un maximum de 4 semaines, et planifiées pour lancement le lundi d’une semaine donnée
- Une option est facturée intégralement dès lors qu’elle est activée 
    - Tant que la date de lancement n’est pas atteinte, l’option peut être annulée ou modifiée sans conséquence pour le Professionnel
    - Passée la date de lancement, le Professionnel ne pourra modifier l’option. Il pourra l’annuler (avec effet immédiat côté Front Office) et en souscrire éventuellement une autre, mais l’option annulée lui sera tout de même intégralement facturée.

Pour le propriétaire les montants totaux prévisionnels des Offres et des options à facturer pour le mois en cours. Ils doivent tenir comptedes règles ci-dessus.


## Avis


### Professionnel 

Le Pro peut depuis son compte : 
  - trier les avis du plus récent au plus ancien
  - les avis non consultés et ceux auxquels il n'a pas répondu son mis en exergue (en gras, un point rouge signifie qu'il ne l'a pas encore ouvert)
  - titre de l'offre concerné, pseudo du membre le commentaire de l’Avis, sa note, sa date, le contexte, ses photos et la réponse éventuelle du Professionnel sont directement affichés dans la liste : il n’y pas utilité d’ouvrir une fenêtre pour consulter les détails (cela étant il faut que l’affichage reste ergonomique).
  
Le nombre total d'avis non lus et non répondus est affiché. S'il sélectionne un avis le pro peut : 
- Afficher les détails de l’Offre concernée ;
- Répondre à l’Avis émis ;
- Supprimer sa réponse à un Avis ;
- « Blacklister » l’Avis (si l’Offre concernée est de type Premium) ;
- Signaler à l’Administrateur un Avis ne respectant pas les conditions d’utilisation de la PACT.

<!-- Conseil SQL : un Avis « blacklisté » n’est plus visible que de son rédacteur et du Professionnel de l’Offre
concernée, avec une indication visuelle spécifique au « blacklistage ». Si un Avis « blacklisté » est
supprimé par son rédacteur, le Professionnel récupère une possibilité de « blacklister » un autre Avis. -->
  

### Membre 
Pour mettre un avis il faut :
- être un membre (avoir signé la PACT)
- Certifier à chaque avis déposé que :
  - l’Avis reflète sa propre expérience et son opinion sur cette Offre
  - qu’il n’a aucun lien (Professionnel ou personnel) avec le Professionnel de tourisme de cette Offre
  - qu’il n’a reçu aucune compensation financière ou autre de sa part pour rédiger cet Avis
  - Il n’est possible de déposer qu’un seul Avis par Membre et par Offre, si nouvel avis alors supression de l'ancien (à faire en sql)

Un membre peut consulter les avis qu'il a déposé, les modalités de l'affichage sont les même que pour le pro (informations du membre sont remplacé par celui du pro). Il peut : 
- Afficher les détails de l’Offre concernée ;
- Supprimer son Avis, entraînant la suppression de toutes les données liées à l’Avis et réincrémentant
le compteur « droit de veto » du Professionnel (si l’Avis était « blacklisté » depuis moins de 12 mois) ;
- Signaler à l’Administrateur une réponse du Professionnel ne respectant pas les conditions
d’utilisation de la PACT.

Un visiteur identifié ou non peut : 
- Signaler à l'administrateur un avis ne respectant pas les conditions d'utilisation de la <b>PACT</b>
- Liker ou disliker un avis. Un compteur affiche le nombre de like et dislike