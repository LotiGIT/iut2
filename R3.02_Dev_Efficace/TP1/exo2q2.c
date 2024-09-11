#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef char chaine20[21];

typedef struct{
    chaine20 nom;
    int population;
    chaine20 capitale;
} t_region;


int main(){
    
    t_region *pt_region = (t_region*)malloc(sizeof(t_region));
    strcpy(pt_region->nom, "Bretagne");
    pt_region->population = 600000;
    strcpy(pt_region->capitale, "Rennes");

    printf("\nNom de la région : %s \nPopulation : %d \nCapitale : %s\n", pt_region->nom, pt_region->population, pt_region->capitale);
   
    return EXIT_SUCCESS;
}
