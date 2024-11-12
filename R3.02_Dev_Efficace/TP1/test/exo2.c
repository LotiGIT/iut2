#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef char chaine20[21];

typedef struct {
    chaine20 nom;
    int population;
    chaine20 capitale;
} t_region;

t_region *p1;



int main(){

    // Question 1
    p1 = (t_region*)malloc(sizeof(t_region));

    printf("Nom de la region : ");
    scanf("%s", p1->nom);

    printf("\nPopulation de la region : ");
    scanf("%d", &p1->population);

    printf("\nNom de la capitale : ");
    scanf("%s", p1->capitale);

    printf("\nRegion : %s \nPopulation : %d\nCapitale : %s", p1->nom, p1->population, p1->capitale);

    return 0;



}
