#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct {
    char nom[50];
    int age;
}tpersonne;


typedef struct elem{
    tpersonne pers;
    struct elem* svt;
}telement;



typedef struct{
    telement* queue;
    telement* tete;
}tfile; 

// Question 1
void init(tfile *file);
int estVide(tfile f);
int obtenirTete(tfile f);
void ajout(tfile *f, int valeur);
void retrait(tfile *f);


int main(){
    tfile maFile;
    init(&maFile);

    // Ajout d'une personne
    tpersonne p1 = {"Alice", 30};
    ajout(&maFile, p1);

    tpersonne p2 = {"Bob", 25};
    ajout(&maFile, p2);

    // Afficher la tête de la file
    if (!estVide(maFile)) {
        tpersonne tete = obtenirTete(maFile);
        printf("Tête de la file: Nom: %s, Âge: %d\n", tete.nom, tete.age);
    }

    // Retrait de la tête de la file
    retrait(&maFile);
    if (!estVide(maFile)) {
        tpersonne tete = obtenirTete(maFile);
        printf("Nouvelle tête de la file après retrait: Nom: %s, Âge: %d\n", tete.nom, tete.age);
    }

    // Libération de la mémoire de la file
    while (!estVide(maFile)) {
        retrait(&maFile);
    }

    return 0;
}

// Question 1
void init(tfile *file){
    file->queue = NULL;
    file->tete = NULL;
}

int estVide(tfile f){
    if((f.queue == NULL) && (f.tete == NULL)){
        return 1;
    } else {
        return 0;
    }
}

int obtenirTete(tfile f){
    if (estVide(f)) {
        printf("La file est vide.\n");
        exit(EXIT_FAILURE); // Erreur si la file est vide
    }
    return f.tete->pers; // Retourner la personne à la tête
}

// ajouter une personne dans la file 
void ajout(tfile *f, int valeur){
    telement = *p;
    p = (telement*)malloc(sizeof(telement));

    p->val=valeur;  // initialisation de la personne
    p->svt=NULL;    // le nouvel élément sera le dernier

    if((f->queue==NULL) && (f->tete==NULLL)){
        f->queue=p;
        f->tete=p;
    }else{
        f->queue=p; // ajout à la fin de la queue
        f->tete=p;  //mise à jour de la queue
    }
}

void retrait(tfile *f){
    telement *p;
    if(f->tete==f->queue){
        p = f->tete;
        f->tete=NULL;
        f->queue=NULL;
        free(p);
    }
}