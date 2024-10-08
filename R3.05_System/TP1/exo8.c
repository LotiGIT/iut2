#include <sys/types.h>
#include <sys/stat.h>
// #include <ubistd.h>
#include <stdio.h>

// argc : nombre de chaines de caractère dans le tableau argv[]
// argv : tableau de caractères "param1" "param2"... (arguments)
// envp : variables d'environnement du programme
int main(int argc, char *argv[], char *envp[]){
    int i;
    

    printf("Liste des arguments :\n");
    // boucle récupérant les arguments passés en paramètre
    for(i=0;i<argc; i++){
        printf("%s\n", argv[i]);
        
    }

    printf("\nListe des variables d'évènement :\n");
    // boucle récupérant les environnements 
    for(i=0;i<argc; i++){
        printf("%s\n", envp[i]);
        
    }

    return 0;
}