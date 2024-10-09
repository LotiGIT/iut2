/*

Je vous ai demandé à la fin du TP noté si on était noté sur les commentaires de notre code
et vous m'avez répondu que non.

J'avais déjà tout commenté lorsque je vous ai posé la question alors je le laisse comme ça.

Bon courage pour les corrections !

*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define TAILLE 8

typedef char chaine8[9];

typedef struct {
    char numColonne;
    chaine8 nom;
    char couleur;
} piece;

typedef struct elem {
    piece val;             
    struct elem *next; 
} element;

typedef element *Echequier[TAILLE];  

// Question 1
void initEchequier(Echequier E);

// Question 2
void ajouterPiece(Echequier e, int I, piece p);

// Question 3
void affiche(Echequier e);

int main() {

    // Initialisation de l'échequier
    Echequier echequier;
    initEchequier(echequier);

    // Quelques pièces pour tester
    piece p1 = {'a', "Roi", 'N'};
    piece p3 = {'b', "Tour", 'N'};
    piece p2 = {'b', "Reine", 'B'};
    piece p4 = {'c', "Cavalier", 'B'};
    piece p5 = {'a', "Pion", 'N'};
    piece p6 = {'b', "Pion", 'N'};
    piece p7 = {'g', "Roi", 'B'};

    // Ajouter les pièces à l'échiquier
    ajouterPiece(echequier, 0, p1);
    ajouterPiece(echequier, 0, p2);  
    ajouterPiece(echequier, 0, p3);
    ajouterPiece(echequier, 1, p4);
    ajouterPiece(echequier, 1, p5);
    ajouterPiece(echequier, 1, p6);
    ajouterPiece(echequier, 7, p7);

    // Afficher l'échiquier
    affiche(echequier);

    return 0;
}


void initEchequier(Echequier E) {
    for (int i = 0; i < TAILLE; i++) {
        E[i] = NULL;  
    }
}


void ajouterPiece(Echequier e, int I, piece p) {
    // Memoire dynamique
    element *nvlPiece = (element *)malloc(sizeof(element));
    if (nvlPiece == NULL) {
        printf("Erreur\n");
        return;
    } else {
        nvlPiece->val = p;
        nvlPiece->next = e[I];
        // Insère la pièce en tête de la liste
        e[I] = nvlPiece;  
    }
}


void affiche(Echequier e) {
   
    printf("  a b c d e f g h\n");

    // Parcours des lignes 
    for (int i = 0; i < TAILLE; i++) {

        // Affichage des lignes
        printf("%d ", 1 + i);  

        // Parcours des colonnes
        for (int j = 0; j < TAILLE; j++) {
            element *courant = e[i];
            bool existe = false;

            // Recherche dans la liste
            while (courant != NULL) {
                if (courant->val.numColonne == 'a' + j) {  
                    // pour la couleur j'ai hésité à l'afficher avec printf("%c%c ", courant->val.couleur, courant->val.nom[0]); 
                    // mais ça faisait moche
                    printf("%c ", courant->val.nom[0]);
                    existe = true;
                    break;  
                }
                courant = courant->next;
            }

            if (!existe) {
                printf(". ");
            }
        }
        printf("\n"); 
    }
}
