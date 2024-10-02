#include <stdlib.h>
#include <stdio.h>
#include <string.h> 
#include <stdbool.h> 

typedef char chaine20[21];

typedef struct noeud * arbre;

typedef struct noeud {
    chaine20 val;
    arbre gauche;
    arbre droit;
}Pnoeud;

void init_arbre(arbre *a);
bool rechercher(arbre a, chaine20 valeur);

int main(){
    arbre monArbre;
    init_arbre(&monArbre);
}

// Question 1
void init_arbre(arbre *a){
    *a = NULL;
}

// Question 2
bool rechercher(arbre a, chaine20 valeur){
    if(a==NULL){
        return false;
    }

    // Comparaison de la valeur actuelle
    int comparaison = strcmp(valeur, a->valeur);

    if (comparaion == 0){
        // valeur trouvée
        return true;
    } else if(comparaion < 0){
        return rechercher(arbre->gauche, valeur);
    }else{
        return rechercher(arbre->droit, valeur);
    }
}

// Question 3 
arbre creerNoeud(chaine20 val){
    arbre nouveau = (arbre*)malloc(sizeof(Pnoeud));
    if(nouveau == NULL){
        printf("erreur d'alloc mémoire\n");
        exit(EXIT_FAILURE);
    }
    strcpy(nouveau->val, val);
    nouveau->gauche = NULL;
    nouveau->droit = NULL;
    return nouveau;
}

void inserer(arbre *a, chaine20 valeur){

    if(*a == NULL){
        *a = creerNoeud(valeur);
        return;
    } 

    int comparaison = strcmp(val, (*a)->valeur);

    if(comparaion < 0){
        inserer(&(*a)->gauche, valeur);
    }else if{
        inserer(arbre->droit, valeur);
    }else{
        print("La valeur %s est présente dans l'arbre\n", valeur);
    }
}