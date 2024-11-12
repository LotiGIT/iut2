#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef char chaine20[21];

typedef struct {
    chaine20 nom ;
    int population ;
    int superficie ;
} t_capitale ;

typedef struct {
    chaine20 nom ;
    t_capitale capitale ;
} t_pays ;


void init_pays(t_pays * t);
void affiche_pays(t_pays t);

int main(){
    
}

void init_pays(t_pays * t){
    t = (t_pays*)mallloc(sizeof(t_pays)); 
    t = NULL;
}

void affiche_pays(t_pays t){
    t = (t_pays*)malloc(sizeof(t_pays));
    printf("Nom Pays : %s\nNom capitale : %s\nPopulation capitale : %d\nSuperficie capitale %d\n", t.nom, t.capitale.nom, t.capitale.population, t.capitale.superficie);
}
