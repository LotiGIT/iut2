
# Analyse

## Profils

<p style="color:#FF0000";>Front-Office :</p>

- Visiteurs
- Membre

<p style="color:#FF0000";>Back-Office :</p>
 
- Professionnel Public
- Professionnel Privé

## EPIC

- Gestion des offres
- Gestion des avis
- Gestion des comptes
- Gestion de la formation


# User Story

## Facturation

```md
en tant que ***developpeur de l'application***

je veux ***envoyer des factures à mes clients***

dans le but de ***payer mes employés et développer mon activité***
```

## Avis

### Avis Professionnel

```md
en tant que ***Professionnel***

je veux ***consulter les avis de mes clients***

dans le but d'***améliorer la qualité de mes offres et être plus concurrentiel***
```

## Compte

### Compte Pro

```md
en tant que ***Professionnel***

je veux ***créer un compte***

dans le but de ***publier des offres et commencer mon activité***
```

```md
en tant que ***Professionnel***

je veux ***mettre une offre hors ligne***

dans le but d'***économiser de l'argent***
```

## Offres

### Offres Pro

```md
en tant que ***Professionnel***

je veux ***créer des offres***

dans le but ***de faire rentrer de l'argent dans les caisses***
```

# Décomposition des US de l'Epic

### Par rôle

```md
en tant que ***Professionnel***

je veux ***créer un compte***

dans le but de ***publier des offres et commencer mon activité***
```

### Par option d'interaction (Avis professionnel)

```md
en tant que ***Professionnel***

je veux ***pouvoir répondre aux avis de mes clients***

dans le but ***de créer une relation entre eux et moi***
```

```md
en tant que ***Professionnel***

je veux ***identifier le client qui a donné son avis***

dans le but de ***personnaliser ses prochaines réservations***
```

### Quick&Dirty vs idéal (Compte)

```md
en tant que ***Membre***

je veux ***déscativer mon compte***

dans le but de ***ne plus apparaitre eb tabt qu'utilisateur de ce site aux yeux des autres utilisateurs***
```
L'intérêt pourrait être d'identifier qui a ajouté quel avis pour faire un tri des avis qu'on veut voir
```md
en tant que ***Membre***

je veux ***supprimer mon compte***

dans le but de ***qu'il n'y ait plus de trace de mon passage sur ce site aux yeux de tous***
```


# Level up ! (Q/R)

1) Comment décomposer les US de Filtrage de liste de façon pertinente ?
```md
On pourrait faire le décomposer par critère où on pourrait filtrer par catégorie, liens, dates.
```

2) Comment décomposer « Ajouter un avis » par rôles et quel intérêt de le faire ?
```md
On pourrait le décomposer par utilisateur : 
- Pro public
- Pro privé
- Membre
-Visiteur
 
Dans le but de clarifier la situation.
```

3) À quel autre US cette logique peut-elle être appliquée ?
```md
Cette logique peut être appliquée pour l'US de la création d'une offre.
```

4) Quel intérêt à décomposer « Rechercher une Offre » par plateforme ?
```md
C'est pour faire des stats, pour que tout le monde puisse avoir accès à mon catalogue et que smon entreprise fasse plus de profit.

On peut géolocaliser un smartphone pour avoir accès à des informations plus précises. "Je veux manger dans un restaurant à proximité".
```

5) Pour quel autre US la décomposition par plateforme serait pertinente?
```md
Pour visualiser l'offre sur une carte.
Pour pouvoir se faire guider sur portable.
Communiquer directement avec l'établissement.
Recevoir des notifications(mail; portable, os).


```
