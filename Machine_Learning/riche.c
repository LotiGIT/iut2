#include <stdio.h>
#include <math.h>

int main() {
    // Déclaration des variables
    double montant_initial, taux_interet, montant_final;
    int nb_annees;

    // Initialisation des variables
    montant_initial = 160000000.0; // 1 million d'euros
    taux_interet = 3.0;          // Taux d'intérêt du Livret A en 2024 (3%)
    
    // Saisie du nombre d'années par l'utilisateur
    printf("Entrez le nombre d'années : ");
    scanf("%d", &nb_annees);

    // Calcul du montant final avec les intérêts composés
    montant_final = montant_initial * pow(1 + taux_interet / 100.0, nb_annees);

    // Affichage des résultats
    printf("Montant initial : %.2f €\n", montant_initial);
    printf("Taux d'intérêt : %.2f%%\n", taux_interet);
    printf("Nombre d'années : %d\n", nb_annees);
    printf("Montant final après %d an(s) : %.2f €\n", nb_annees, montant_final);

    return 0;
}
