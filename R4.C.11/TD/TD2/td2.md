# Exercice 1 : Bibliothèque

## 1 - Situation initiale 

### 1- Quel est l’objectif de ce processus ?
L'objectif de ce processus est de gérer efficacement les emprunts d'ouvrages dans une bibliothèque, en s'assurant que les adhérents remplissent les conditions nécessaires et que les opérations liées aux emprunts et retours soient correctement enregistrées.

---

### 2- Quelles sont les activités de ce processus ?
1. Rechercher la fiche de l'adhérent.
2. Valider la possibilité d’emprunt.
3. Enregistrer le prêt de l’ouvrage.
4. Enregistrer le retour de l’ouvrage.

---

### 3- Quel est l’événement déclencheur de ce processus ?
L’événement déclencheur de ce processus est une demande d’emprunt effectuée par un adhérent.

---

### 4- Quelles sont les informations en entrée de ce processus ?
- Informations sur l’adhérent (identité, historique des prêts, statut d’adhésion).
- Informations sur l’ouvrage (disponibilité, état, date d’échéance si déjà emprunté).

---

### 5- Quels sont les événements qui déclenchent des activités de ce processus ?
1. Une demande d'emprunt déclenche la recherche de la fiche de l'adhérent.
2. La validation des conditions d’emprunt dépend du statut de l’adhérent et des règles établies.
3. Le retour de l'ouvrage par l'adhérent déclenche l’enregistrement de cette action.

---

### 6- Quel est le résultat de ce processus ?
- Pour un emprunt validé : l’enregistrement du prêt avec mise à jour de l’état de l’ouvrage et du compte de l’adhérent.
- Pour un retour : l’état de l’ouvrage et l’historique du compte de l’adhérent sont mis à jour.

---

### 7- Représenter graphiquement ce processus
Voici une description pour représenter graphiquement le processus :
1. **Déclencheur** : Demande d'emprunt par un adhérent.
2. **Étape 1** : Recherche de la fiche de l'adhérent.
3. **Étape 2** : Validation de la possibilité d'emprunt (conditions à respecter).
   - Si refus : fin du processus.
   - Si accepté : enregistrement du prêt.
4. **Étape 3** : Retour de l'ouvrage.
5. **Résultat** : Mise à jour des informations concernant l’ouvrage et le compte de l’adhérent.

---

### 8- Quelles sont les tables en consultation ou mise à jour dans la base de données au cours de ce processus ?
1. **Tables consultées :**
   - Table des adhérents (identifiants, historique des prêts, statut d’adhésion).
   - Table des ouvrages (disponibilité, état, identifiant de l’emprunt en cours).
2. **Tables mises à jour :**
   - Table des emprunts (enregistrement d’un nouveau prêt ou mise à jour à la restitution).
   - Table des ouvrages (modification de l’état ou de la disponibilité).
   - Table des adhérents (mise à jour de l’historique des emprunts).

--- 

## 2 - Amélioration du processus 

1. **Les retards ne sont pas pris en compte**
2. **Les réservations des ouvrages empruntés n'est pas pris en compte** 
3. **La gestion des ouvrages abîmés** 

### Suggestions d’amélioration du processus :
1. **Ajouter un mécanisme de gestion des retards :** 
   - Évaluer et appliquer des pénalités automatiquement selon les retards constatés.
   - Mettre en place un système d’alerte pour rappeler les dates de retour.

2. **Inclure un système de réservation des ouvrages :**
   - Permettre aux adhérents de réserver les ouvrages non disponibles.

3. **Protocole pour ouvrages perdus ou abîmés :**
   - Ajouter une étape pour facturer les ouvrages perdus ou détériorés.

# Exercice 2 : Identification de processus (cas d’une pizzéria)

## 1) Identification des processus

Voici l’identification des principaux processus :

| **Nom du processus**          | **Objectif**                                              | **Acteurs**                  | **Activités**                                                                 | **Ressources**                                                                                                                                          |
|--------------------------------|----------------------------------------------------------|------------------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inscription du client          | Permettre aux clients de s’inscrire                      | Clients                     | Remplissage d’un formulaire avec nom, prénom, email, téléphone, adresse        | Formulaire d’inscription, base de données clients                                                                                                       |
| Passation de commande          | Faciliter la commande de pizzas                          | Clients                     | Sélection de pizzas, choix du format, validation, paiement                    | Interface de commande en ligne, base de données des pizzas et des commandes                                                                             |
| Préparation des commandes      | Préparer et notifier que les pizzas sont prêtes          | Employés (ou patron)        | Consultation des commandes, préparation des pizzas, notification               | Outils de cuisine, base de données des commandes                                                                                                        |
| Gestion des avis et suggestions| Améliorer la satisfaction client                         | Clients, employés (ou patron)| Rédaction et consultation des avis, suggestions pour des produits ou ingrédients | Interface d’évaluation/suggestion, base de données des retours clients                                                                                  |
| Gestion des données quantitatives | Analyser les performances de la pizzéria               | Patron                      | Suivi des ventes, analyse des données quantitatives, comparaison avec d’autres pizzerias | Base de données des ventes, outils d’analyse                                                                                                            |
| Gestion de la liste des pizzas | Maintenir à jour l’offre de pizzas                       | Patron                      | Ajout, modification ou suppression de pizzas                                  | Interface d’administration, base de données des pizzas                                                                                                  |

---

## 2) Classification des processus

| **Nom du processus**          | **Type de processus**               |
|--------------------------------|-------------------------------------|
| Inscription du client          | Processus support                  |
| Passation de commande          | Processus opérationnel / réalisation |
| Préparation des commandes      | Processus opérationnel / réalisation |
| Gestion des avis et suggestions| Processus de pilotage              |
| Gestion des données quantitatives | Processus de pilotage             |
| Gestion de la liste des pizzas | Processus support                  |

---

## Représentation graphique d’un processus

Voici une suggestion pour représenter graphiquement le processus "Passation de commande" en notation BPMN :
1. **Déclencheur** : Inscription terminée.
2. **Étape 1** : Le client choisit une pizza.
3. **Étape 2** : Le client sélectionne le format.
4. **Étape 3** : Le client valide et paie.
5. **Résultat** : Commande enregistrée dans la base de données.





