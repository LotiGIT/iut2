#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Définition d'un noeud de la liste chainée
typedef struct{
    int donnees;
    struct Node* next;
}Node;

// Définition d'un ensemble comme un pointeur vers un noeud
typedef Node * Ensemble; 

Ensemble initialiser(){
    return NULL;
}

// Fonction pour ajouter un entier à l'ensemble
Ensemble ajouter(Ensemble e, int x) {
    // Si l'entier est déjà dans l'ensemble, ne rien faire
    if (!appartient(e, x)) {
        // Créer un nouveau nœud
        Node* nouveau = (Node*)malloc(sizeof(Node));
        nouveau->donnees = x;
        nouveau->next = e; // Insérer le nouveau nœud au début
        e = nouveau;
    }
    return e;
}

int appartient(Ensemble e, int x){
    Node* courant = e;
    while (courant != NULL){
        if(courant->donnees == x){
            return 1;
        }
        courant = courant->next; // passe au noeud suivant
    }
    return 0;
}

void afficher(Ensemble e){
    Node * courant = e;
    printf("{ ");
    while (courant != NULL){
        printf("%d ", courant->donnees);
        courant = courant->next;
    }
    printf("}\n");
}

int main(){
    Ensemble e = initialiser(); // initialisation d'un ensemble vide
    int x;
    // Ajouter des éléments à l'ensemble
    e = ajouter(e, 5);
    e = ajouter(e, 10);
    e = ajouter(e, 3);

    //Afficher les éléments
    printf("Affichage des éléments de l'ensemble : ");
    afficher(e);

    // Tester l'appartenance
    printf("Tester l'appartenance en rentrant un entier : ");
    scanf("%d", &x);
    if(appartient(e, x)){
        printf("%d appartient à l'ensemble.\n");
    } else{
        printf("%d n'appartient pas à l'ensemble.\n");
    }

    return 0;
}