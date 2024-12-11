#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>


int main(int argc, char *argv[]) {
    int file = open("mon_tube", O_WRONLY);

    if (file == -1) {
        perror("Erreur d'ouverture du tube");
        return 1; 
    }
    for(int i=0; i < argc; i++){
        write(file, argv[i], strlen(argv[i]));
        write(file, " ", 1);
    }
    write(file, "\n", 1);
    close(file);
    return 0;

}