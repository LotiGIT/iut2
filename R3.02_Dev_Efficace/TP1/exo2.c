#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef char chaine20[21];

typedef struct{
    chaine20 nom;
    int population;
    chaine20 capitale;
} t_region;
t_region* P1;

int main(){


    P1 = (t_region*)malloc(sizeof(t_region));
    
    printf("\nnom région (20 mots) : ");
    scanf("%s", P1->nom);

    printf("\npopulation : ");
    scanf("%d", &P1->population);

    printf("\ncapitale (20mots): ");
    scanf("%s", P1->capitale);

    printf("\nnom région enregistré : %s\n", P1->nom);
    printf("population enregistrée : %d\n", P1->population);
    printf("capitale enregistrée : %s\n", P1->capitale);
    


    // // Correction : 
    // t_region p1;

    // printf("Donnez le nom de la région : ");
    // scanf("%s", p1.nom);

    // printf("Donnez la population de la région : ");
    // scanf("%d", &(p1.population));

    // printf("Donnez la capitale de la région : ");
    // scanf("%s", p1.capitale);

    // printf("\n\nNom de la région : %s \nPopulation %d \nCapitale : %s\n\n", p1.nom, p1.population, p1.capitale);

    return 0;
    
}