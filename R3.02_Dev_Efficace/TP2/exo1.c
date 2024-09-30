#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef char nom50[50];

typedef struct{
    int age;
    nom50 nom;
}tpersonnes;

typedef struct elem{
    tpersonnes personne;
    struct elem* next;
}telement;

typedef telement *tliste;

void init_liste(tliste *l){
    *l = NULL;
}

void insertion_en_tete(tliste *l, nom50 nom, int age){
    telement *e = (telement*)malloc(sizeof(telement));
    strcpy(e->personne.nom, nom);
    e->personne.age = age;
    e->next = *l;

    *l = e;


}

void affichagePers(tpersonnes p){
    printf("\nNom : %s\nAge : %d ans\n", p.nom, p.age);
}

void affichageListe(tliste l){
    tliste p;
    printf("Contenu de la liste : \n");
    p=l;
    while(p!=NULL){
        affichagePers(p->personne);
        p=p->next;
    }
}



int main(){
    tliste maliste;
    int age;
    nom50 nom;

    init_liste(&maliste);
    insertion_en_tete(&maliste, "Marcel", 37);
    affichageListe(maliste);
    printf("Donner un nom (-1 pour terminer) : \n");
    scanf("%s", nom);

    while(strcmp(nom, "-1")!=0){
        printf("Donnez un age : ");
        scanf("%d", &age);

        insertion_en_tete(&maliste, nom, age);
        printf("Donner un nom (-1 pour terminer) : \n");
        scanf("%s", nom);
    }
    affichageListe(maliste);

}

