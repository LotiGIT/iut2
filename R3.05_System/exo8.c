#include <sys/types.h>
#include <sys/stat.h>
#include <ubistd.h>
#include <stdio.h>

int main(int argc, char *argv[], char *envp[]){
    int i, ii = 0;
    printf("Nombre d'aguments : %d", &argc);

    printf("\nListe des arguments\n");
    while(argv[i] > 0){ // utiliser un for(avec int i = 0)
        printf("\n%s\n", argv[i]);
        argc--;
    }

    printf("\nListe des paramètres\n");
    while(envp[ii] != NULL){
        printf("\n%s\n", &envp[ii]);
        ii++;
    }

}