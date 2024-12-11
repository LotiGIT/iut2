#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main(){
    int file = open("mon_tube", O_RDONLY);
    if (file == -1) {
        perror("Erreur d'ouverture du tube");
        return 1; 
    }
    close(file);

    return 0;
}