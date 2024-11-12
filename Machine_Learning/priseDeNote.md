# Intro

## Modélisation statistique

Objectif :
- Expliquer et analyser

Focus :
- Fiabilité des conclusions : tests d'hypothèses et intervalles de confiance

Utilisation des données :
- Tous les échantillons

Librairies python : 
 - statsmodel

## Modélisation prédictive (Machine Learning)

Objectif :
- Prédire

Focus :
- Performance, résilience et robustesse (capacité d'adaptation)

Utilisation des données :
- Une partie des échantillons est réservée à l'évaluation des performances du modèle

Librairies python : 
 - scikit-learn, PyTorch, TensorFlow

<!-- Les librairies mentionnées sont les plus courantes mais il en existe d'autres (XGBoost, Keras...) -->


# Machine Learning


A la base du Machine Learning il y a le <font color="red"><i> dataset</i></font>

Une partie des données récoltées une fois numérisées, nettoyées, normalisées (<font color="red"><i>data cleaning</i></font>) est séparée du reste des autres données.

- Partie 1 (80%) :
```md
Réservée à l'entrainement du modèle : TRAIN
```

- Partie 2 (20%) :
```md
Réservée pour évaluer la performance du modèle sur des données qu'il n'a pas vu : TEST
```

## Distinction 

### Exemple 

On cherche à classer des images de chiens et de chats automatiquement via le Machine Learning.

### Approche non supervisée

Les photos n'ont pas d'étiquettage, le modèle ne sait pas quelle image présente un chien ou un chat. Il va donc essayer de <b>regrouper automatiquement</b> les photos grâce à leurs caractéristiques intrasèques.
<br>
<br>
Il les regroupe en grappes, sans connaissances préalables sur les espèces.
<br>
Le modèle fait du <font color="red"><b> clustering</b></font>

### Approche supervisée

Les images sont <b>étiquettées</b> à la main ("chat" ou "chien") avant de les donner au modèle. Cela peut entrainer un coût important car potentiellement long de le faire sur une banque de milliers d'images.
<br>
Les <b>étiquettes</b> sont alors la variable cible que le modèle va chercher à prédir.
<br>
<br>
En fonction de la variable cible on parlera : 

<ul>de <b>classification</b> lorsque l'on prédit des catégories : 
<ul><li>binaire (Oui/Non)</li><li>ordinale (petit, moyen, grand)</li><li>ou nominale (chien, chat, brebis, chameau - bleu, rose, jaune, orange ...)</li></ul>
et de <b>régression</b> lorsque l'on prédit une variable continue : prix, âge, salaire, volume, température, etc.
</ul>

Approche supervisée --> Clustering
Approche non supervisée --> Classification et Régression

### Résumé
  
    Le Perceptron, ancêtre des réseaux de neurones actuels, a été inventé en 1957 : le Machine Learning ne date pas d'hier.

    La modélisation statistique tend à comprendre la dynamique interne des variables tandis que le Machine Learning a pour unique but la prédiction d'une de ces variables.

    Il y a 3 étapes pour développer un modèle : travail sur la donnée, validation croisée et optimisation.

    On distingue deux approches : l’approche supervisée, où une des variables est utilisée comme cible de la prédiction ; l'approche non supervisée qui vise à regrouper les échantillons par similarité (on parle de clustering).

    Dans l'approche supervisée, dans le cas d'une variable cible continue on parlera de régression, et de classification si la variable cible est composées de catégories.

    Vous trouverez de nombreux datasets pour le Machine Learning sur le site de UCI.


# Différents modèles

1. Les modèles de régression
   - Jeux de données à taille limitée avec relation entre les variables
2. Les modèles à base d'arbres
   - Jeux de données tabulaires de taille plus conséquente (+robuste : données manquantes/observations aberrantes) <b>OUTLIERS</b> (gagnants des compétitions Kaggle)
3. Les réseaux de neurones et le Deep Learning
    - Jeux de données gros volume, + complexe (images, vidéo).

# Valeur aberrante

Donnée qui s'écarte du reste des observations dans un ensemble de données.
    OUTLIER

# Algo particulier

## Gradient stochastique (à apprendre)

Communément utilisé pour entraîner les modèles de Machine Learning, Deep Learning inclus.

### Détails du gradient stochastique

- Soit un jeu d'échantillons.
- On cherche un vecteur h qui minimise un critère (<b>fonction de coût</b>)
- On se dote d'un paramètre (<b>learning rate</b>)
  - règle l'intensité de la correction de l'estimation apporté par l'erreur d'estimation. En gros c'est un bouton qui permet d'ajuster la vitesse de mise à jour de l'estimation donc de la vitesse de convergence de l'algo. 

On aura, de façon simplifiée, à chaque itération :

- calcul de l'erreur à partir de l'estimation et des valeurs réelles :

    - erreur = f(estimation, groundtruth)

- mise à jour de l'estimation :

    - estimation = estimation * learning_rate * f(erreur)

- stop en fonction d'un seuil d'erreur minimal.



### Learning rate

1. Learning Rate petit : convergence lente mais meilleure précision
2. Learning Rate grand : convergence rapide mais résultats moins précis
3. Learning Rate trop grand : explosion et non convergence

<b>Le learning rate est un des paramètres principaux des modèles que je serais amené à entraîner.</b>

## Résumé

3 types de modèles couramment utilisés : 
- Linéaire
- A base d'arbres
- Réseaux de neurones
  
Il faut distinguer le type du modèle (classe, famille), de sa version instanciée, qui est entraineée sur un jeu de données et prête à faire ses prédictions.

Un algorythme est la répétition d'un calcul simple, par itération il s'approche du résultat attendu.

L'erreur d'estimation est un des <b>éléments clés</b> de l'lgo et du modèle de ML. Il permet de juger la pertinance de l'estimation.


# Projet DATA Science

## Phase 1 - Définir spécifications à partir de la problématique business

Il faut au minimum :
  - données pertinantes
  - sujet ou produit défini
  - montrer un avantage de l'approche prédictive plutôt qu'une solution plus simple
  
En premier lieu il faut une étude de <b>benchmark</b>
  - Comment définir le succès du projet ?
  - Comment mesurer la performance du système
  - Quelle métrique utiliser pour le scorinf du modèle
  - Quel score sera nécessaire à obtenir pour réaliser les objectifs du projet ?

### Exemples de benchmark

Prédiction météo<br>
Prédiction du prix d'une course de taxi<br>
Estimation des ventes d'un produit basée sur la moyenne des 3 derniers mois pour estimer les ventes futures

### Autres

Les projets suivants nécessitent une bonne dose de ML :
- prédire la défaillance d'une pièce ou d'un serveur informatique, ou le risque défaut d'un crédit
- classer automatiquement de grand volumes de fichiers sons ou images
- détecter des contenus agressifs ou des fake news sur les réseaux sociaux

## Phase 2 - Concevoir prototype et valider faisabilité projet

- étape 1 : mettre en forme les données
  - nettoyer les données càd résoudre les outlier(données aberrantes) et les données manquantes
  - créer de nouvelles variables à partir de variables existantes, *feature engineering*
  - numériser les données catégoriques, textuelles ou images pour qu'elles soint ingérables par un modèle
- étape 2 : choisir le type de modèle : GLM, Tree, NN ou autre
- étape 3 : répartir les données avec une partie réservée pour l'entrainement et l'autre pour la validation
- étape 4 : optimiser les paramètres du modèle

Ces étapes peuvent être cyclique.

## Phase 3 - Mettre en production le projet

Penser à la mise en production de centaines voir de miliers de modèles en parallèle, qui doivent être automatiquement : 
- mis à jour
- (ré)entraînés
- déployés
- surveillés

Penser aux crises mondiales récentes, crises économiques, guerres, pandémies, bouleversement climatiques, qui vont continuer à chambouler de nombreux modèles de prédiction<br>


On parle alors de drift du modèle. En termes d'outillage on passe de Python et de librairies de ML (scikit-learn, PyTorch, TensorFlow) à des plateformes de gestion des actifs à large échelle comme Kubernetes et des outils de mise en production et surveillance comme Seldon ou MLflow.


## Résumé

- Un projet de Data Science a 3 grandes phases : conception, modélisation et production.

- Définir un benchmark en préalable du projet permet de valider le retour sur investissement de l'approche Machine Learning comparée à une approche plus simple et plus directe.

- Un bon modèle prédictif offre de bonnes performances face à des données qu'il n'a pas rencontrées lors de son entraînement. Il sait extrapoler.

- Il faut régulièrement ré-entraîner un modèle pour qu'il s'adapte aux évolutions naturelles des données.

- Le MLOps est un rôle clé qui a pour responsabilité de mettre les modèles en production et de les surveiller.





