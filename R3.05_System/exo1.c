#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>   // pour open()
#include <unistd.h>  // pour read(), write(), close()
#include <stdlib.h>  // pour exit()

#define TAILLE_BUFFER 1024
#define NEW "NEW"
#define OLD "OLD"


int main(){
    
    int ret, fd_in, fd_out;
    char buffer[TAILLE_BUFFER];

    fd_in = open(OLD, O_RDONLY); // ouverture du fichier ORIG.txt

    if((fd_in = open(OLD, O_RDONLY)) == -1){
        perror("Erreur lors de l'ouverture du fichier source");
        return EXIT_FAILURE;
    }
    if ((fd_out = open(NEW, O_CREAT | O_WRONLY | O_TRUNC, S_IRWXU )) < 0){
        perror("Erreur lors de la création du fichier NEW");
        return EXIT_FAILURE;
    }

    while((ret = read(fd_in, buffer, TAILLE_BUFFER))> 0){
        write(fd_out, buffer, ret);
    }

    


    return EXIT_SUCCESS;

}