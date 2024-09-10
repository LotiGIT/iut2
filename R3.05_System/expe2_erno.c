#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>

int main()
{
    int ret;

    ret = rmdir("D1");
    if (ret == -1) // Erreur
    {
        if(errno == ENOENT){ // traitage manuel
            printf("D1 n'existe pas !\n");
        }else{ // on donne les autres a perror
            perror("Erreur inconnue");
        }
        return EXIT_FAILURE;
        
    } else { // reoturne forcément 0 donc tout est ok
        printf("D1 supprimé\n");
    }
    return EXIT_SUCCESS;
}