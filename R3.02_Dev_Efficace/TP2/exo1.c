#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef char nom50[50];

// Question 1
typedef struct{
    int age;
    nom50 nom;
}tpersonnes;

typedef struct elem{
    tpersonnes personne;
    struct elem* next;
}telement;

// Question 2
typedef telement *tliste;

void init_liste(tliste *l){
    *l = NULL;
}

// Question 3
void insertion_en_tete(tliste *l, nom50 nom, int age){
    telement *e = (telement*)malloc(sizeof(telement));
    strcpy(e->personne.nom, nom);
    e->personne.age = age;
    e->next = *l;

    *l = e;


}

// Question 4
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

// Question 5
telement * existe(tliste l, nom50 leNom){
    telement * res = NULL;
    telement *parcours;
    parcours = l;

    while((res==NULL)&&(parcours!=NULL)){
        if(strcmp(parcours->personne.nom, leNom)==0){
            res = parcours;
        }
        return res;
    }
    return 0;


}

// Question 6
void supprimer_tete(tliste*l){
    telement * p;

    if(*l!=NULL){
        p=*l;
        *l=(*l)->next;

        free(p);
    }
}

// Question 7
int compter(tliste l, nom50 nom){
    int res = 0;
    telement *clui;
    clui = existe(l, nom);


    while(clui!=NULL){
        res++;
        clui = existe(clui->next, nom);
    }
    return res;

}

// Question 8
telement * recherche(tliste l, int i){
    int count = l;
    telement *parcours;
    parcours = l;
    
    while((parcours!=NULL) && (count<i)){
        count++;
        parcours = parcours->next;
    }
    return parcours;


}

// Question 9 
void insererFinListe(tliste *liste, chaine n, int a){
    telement*e = (telement*)malloc(sizeof(telement));
    telement *parcours;
    strcpy(e->personne.nom, n);
    e->personne.age = a;
    e->next = NULL;

    if((*liste)==NULL){
        *liste= e;
    }else{
        parcours = *liste;
        while(parcours->next !=NULL){
            parcours = parcours->next;
        }
        parcours->next=e;
    }
}

// Question 10
void insererNimporteOu(tliste, chain n, int a, int I){
    telement* e;
    telement* parcours;

    int cpt = 1;
    parcours = liste;
    while((parcours!=NULL) && (cpt != I)){
        parcours = parcours -> next;
        cpt++;
    }

    if(parcours != NULL){
        e = (telement*)malloc(sizeof(telement));
        strcpy(e->pers.nom, n);
        e->pers.age = a;
        e->next=parcours->next;
        parcours->next=e;
    }else{
        printf("Pas de place pour insérer l'élémentà la position %d\n", I);
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

    if(existe(maliste, "Michel")==NULL) printf("\nMichel est absent\n");
    if(existe(maliste, "Maurice")==NULL) printf("\nMaurice est absent\n");

    printf("Nombre de Maurice : %d\n", compter(maliste, "Maurice"));



}

