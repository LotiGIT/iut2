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