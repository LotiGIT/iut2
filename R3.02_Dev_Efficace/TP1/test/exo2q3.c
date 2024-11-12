#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef char chaine20[21];

typedef struct {
    chaine20 nom;
    int population;
    chaine20 capitale;
} t_region;


t_region *pt_region;

int main(){

    // Question 2
    pt_region = (t_region*)malloc(sizeof(t_region));
    
    printf("Nom de la region : ");
    scanf("%s", pt_region->nom);

    printf("\nPopulation de la region : ");
    scanf("%d", &pt_region->population);

    printf("\nNom de la capitale : ");
    scanf("%s", pt_region->capitale);

    printf("\nRegion : %s \nPopulation : %d\nVille : %s\n", pt_region->nom, pt_region->population, pt_region->capitale);

    return 0;


}
