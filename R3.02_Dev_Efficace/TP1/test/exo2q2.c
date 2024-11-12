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
    strcpy(pt_region->nom, "Bretagne");
    pt_region->population = 600000;
    strcpy(pt_region->capitale,"Rennes");

    printf("\nRegion : %s \nPopulation : %d\nVille : %s\n", pt_region->nom, pt_region->population, pt_region->capitale);

    return 0;


}
