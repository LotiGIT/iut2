#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <sys/stat.h>

int main(){
    int ret;
    ret = mkdir("blabla", 0777);
    if(ret == -1) // Erreur
    {
        if(errno == EEXIST){
            printf("Le dossier existe deja\n");
        }else{
            perror("Erreur inconnue\n");
        }return EXIT_FAILURE;
    }else{
        printf("Dossier créé\n");
        chmod("blabla", 0777);
    }


    return EXIT_SUCCESS;
}