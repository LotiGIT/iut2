#include <stdlib.h>
#include <stdio.h>
#include <string.h>

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
    t_pays *pays=(t_pays*)malloc(sizeof(t_pays));
    init_pays(pays);
    affiche_pays(*pays);


    return EXIT_SUCCESS;
}

void init_pays(t_pays * t){
    printf("\nNom du pays : ");
    scanf("%s", t->nom);

    printf("\nCapitale : ");
    scanf("%s", t->capitale.nom);

    printf("\nPopulation de la capitale : ");
    scanf("%d", &t->capitale.population);

    printf("\nSuperficie de la capitale : ");
    scanf("%d", &t->capitale.superficie);    
}

void affiche_pays(t_pays t){
    printf("\nNom du pays : %s \nNom de la capitale : %s \nPopulation : %d \nSuperficie : %dkm2\n", t.nom, t.capitale.nom, t.capitale.population, t.capitale.superficie);
}