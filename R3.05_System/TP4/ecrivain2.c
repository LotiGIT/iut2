#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(){
    int file = open("mon_tube", O_WRONLY);
     
    if (file == -1) {
        perror("Erreur d'ouverture du tube");
        return 1; 
    }else{
        for(int i=0; i < argc; i++){
            ssize_t res = write(file, argv[i], strlen(argv[i]));
        }
        printf("")
    }
    return 0;
    
}