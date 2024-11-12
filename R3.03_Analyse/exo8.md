# Exo 8 

## Complétion du diagramme des UC


## Descrpition cas d'utilisation

### Démarrer partie

- Scénario nominal
    1) Le cas commence lorsqu'un joueur souhaite jouer au puissance 4 et démarre l'application
        2) Le systeme ouvre un menu avec 3 choix : nouvelle partie, charger partie, quitter jeu
            3) Le système demande de renseigner les noms des utilisateurs, un tirage au sort désigne le joueur qui commence la partie dans le cas d'une nouvelle partie
            4) Le systeme affiche une liste des parties sauvegardées dans le cas du chargement d'une partie



- Scénario de sauvegarde 
    1) l'utilisateur décide de créer une nouvelle sauvegarde
        2) la partie sauvegardée est numérotée automatiquement

- Scénario nouvelle partie
    1) Depuis le menu, l'utilisateur choisit de lancer une nouvelle partie
        2) La partie en cours, s'il y en avait une est annulée
        3) Le systeme affiche un message demandant à l'utilisateur s'il veut sauvegardée la partie en cours

- Scénario chargement d'une partie sauvegardée
    1) La partie chargée devient la partie en cours lors du chargement de la partie sauvegardée 

- Scénario quitter la partie
    1) L'utilisateur décide de quitter la partie, il peut le faire à n'importe quel moment

- Postconditions
    - A) Les deux joueurs ont rentré un pseudonyme



### Jouer pion

- Scénario nominal
    1) L'utilisateur souhaite placer un pion dans la grille de jeu
    2) Le systeme refuse qu'un utilisateur joue deux fois, il fait jouer les utilisateurs à tour de rôle
    3) Le joueur pose son pion dans une colonne 

- Scénario de refus
    1) Le joueur souhaite placer son pion dans une colonne pleine

- Postconditions 
    - A) Une partie est lancée 

