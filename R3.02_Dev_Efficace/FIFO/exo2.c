#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>


typedef struct elem{
    int val ;
    struct elem* next;
} telement;


typedef struct{
    telement* queue;
    telement* tete;
    telement* max;
    telement* min;
} tfileD; 

// Question 1 :
void initialisation(tfileD *f);
bool estvide(tfileD f); 

// Question 2 :
void afficheInfosFile(tfileD f);

// Question 3 : 
void ajouteEnQueue(tfileD *f, int v);

// Question 4 :
void supprime(tfileD *f);

int main(){

    // Initialisation de la file
    tfileD file;
    initialisation(&file);

    // Ajouter des éléments dans la file
    ajouteEnQueue(&file, 10);
    ajouteEnQueue(&file, 20);
    ajouteEnQueue(&file, 5);
    ajouteEnQueue(&file, 15);

    // Afficher les informations de la file
    afficheInfosFile(file);

    // Supprimer un élément de la file
    supprime(&file);

    // Afficher les informations après suppression
    printf("\nAprès suppression:\n");
    afficheInfosFile(file);

    return 0;
}

void initialisation(tfileD *f){
    f->tete = NULL;
    f->queue = NULL;
    f->max = NULL;
    f->min = NULL;
}

bool estVide(tfileD f){
    if((f.tete = NULL) && (f.queue = NULL) && (f.max = NULL) && (f.min = NULL)){
        return 1 ;
    }
    return 0;
}

void afficheInfosFile(tfileD f){
    if(estVide(f)){
        printf("La file est vide\n");
    }
    printf("\nTete : %d\nQueue : %d\nMax : %d\nMin : %d\n", f.tete->val, f.queue->val, f.max->val, f.min->val);
}

void ajouteEnQueue(tfileD *f, int v){
    telement *conteneur;
    conteneur = (telement*)malloc(sizeof(telement));
    conteneur->val = v;
    conteneur->next=NULL;

    if((f->queue==NULL)&& (f->tete==NULL)){
        f->queue = conteneur;
        f->tete = conteneur;
    }

    f->queue->next = conteneur;
    f->queue = conteneur;

    // Mise à jour des valeurs min et max
    if (f->max == NULL || v > f->max->val) {
        f->max = conteneur;
    }

    if (f->min == NULL || v < f->min->val) {
        f->min = conteneur;
    } 
}

void supprime(tfileD *f){
    if (!estVide(*f)) {
        telement *conteneur = f->tete;
        f->tete = f->tete->next;
        if (f->tete == NULL) {
            f->queue = NULL;  // Si la file est maintenant vide
        }
        free(conteneur);
    }
}

