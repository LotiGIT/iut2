#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct {
    char nom[50];
    int age;
}tpersonne;


typedef struct elem{
    tpersonne pers;
    struct elem* next;
}telement;



typedef struct{
    telement* queue;
    telement* tete;
}tfile; 

typedef struct{
    tfile urgent;
    tfile important;
    tfile standard;
}tfilePrio;

// Question 1
void initFile(tfile * t);
void ajouter(tfile *t, tpersonne personne);
void supprimer(tfile *t);

// Question 2
void creationPrio(tfilePrio * fp);

// Question 3 
void ajoutePrio(tfilePrio *fp, tpersonne p, int priorite);

//Question 4
void affichePrio(tfilePrio * fp);

int main(){
    // Création des files de priorité
    tfilePrio files;
    creationPrio(&files);

    // Création de quelques personnes
    tpersonne p1 = {"Alice", 25};
    tpersonne p2 = {"Bob", 30};
    tpersonne p3 = {"Charlie", 22};
    tpersonne p4 = {"Diana", 40};
    tpersonne p5 = {"Eva", 28};

    // Ajout des personnes dans les files avec leurs priorités respectives
    ajoutePrio(&files, p1, 0); // Urgent
    ajoutePrio(&files, p2, 1); // Important
    ajoutePrio(&files, p3, 2); // Standard
    ajoutePrio(&files, p4, 0); // Urgent
    ajoutePrio(&files, p5, 1); // Important

    // Affichage des personnes dans les files de priorité
    affichePrio(&files);
}

// initialise la tete de la file et la queue de la file en vide
void initFile(tfile * t){
    t->queue = NULL;
    t->tete = NULL;
}

void ajouter(tfile *t, tpersonne personne){
    // création du conteneur contenant une personne et ses caractéristiques
    telement *p;
    p = (telement*)malloc(sizeof(telement));
    // initialisation
    p->pers = personne;
    p->next = NULL;

    if((t->queue==NULL) && (t->tete==NULL)){ // si la tete et la queue est nulle alors leur valeur est maintenant celle du conteneur contenant la teprsonne
        t->queue = p;
        t->tete = p;
    }else{ // sinon le file est placé à la dernière position (queue) et la queue du file pointe vers un le conteneur 
        t->queue->next = p;
        t->queue=p;
    }
}

void supprimer(tfile *t){
    telement *conteneur;
    if(t->queue==t->tete){
        conteneur = t->tete;
        t->queue = NULL;
        t->tete = NULL;
        // permet de libérer le conteneur de sa mémoire pré-établi dynamiquement
        free(conteneur);
    }else{
        conteneur = t->tete;
        t->tete = t->tete->next;
        free(conteneur);
    }

}

void creationPrio(tfilePrio * fp){
    initFile(&(fp->urgent));
    initFile(&(fp->important));
    initFile(&(fp->standard));
}

void ajoutePrio(tfilePrio *fp, tpersonne p, int priorite){
    switch (priorite){
        case 0:
            ajouter(&(fp->urgent), p);
            break;
        case 1:
            ajouter(&(fp->important), p);
            break;
        case 2:
            ajouter(&(fp->standard), p);
            break;
    }
}

void affichePrio(tfilePrio * fp){
    telement *courant;

    printf("---------------- File Urgent ----------------\n");
    courant = fp->urgent.tete;
    while(courant !=NULL){
        printf("\nAge : %d\nNom : %s\n\n", courant->pers.age, courant->pers.nom);
        courant = courant->next;
    }

    printf("\n---------------- File Important ----------------\n\n");
    courant = fp->important.tete;
    while(courant !=NULL){
        printf("Age : %d\nNom : %s\n\n", courant->pers.age, courant->pers.nom);
        courant = courant->next;
    }

    printf("\n---------------- File Standard ----------------\n\n");
    courant = fp->standard.tete;
    while(courant !=NULL){
        printf("Age : %d\nNom : %s\n\n", courant->pers.age, courant->pers.nom);
        courant = courant->next;
    }

}