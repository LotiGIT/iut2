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
    
    t_region *p1 = (t_region*)malloc(sizeof(t_region));

    printf("Donnez le nom de la région : ");
    scanf("%s", p1->nom);

    printf("Donnez la population de la région : ");
    scanf("%d", &(p1->population));

    printf("Donnez la capitale de la région : ");
    scanf("%s", &p1->capitale);

    printf("\n\nNom de la région : %s \nPopulation : %d \nCapitale : %s\n\n", &p1->nom, p1->population, p1->capitale);
   
    return EXIT_SUCCESS;
}
