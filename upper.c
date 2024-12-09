#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>



int main (){
    size_t taille = 1;
    char c;
    int ouioui = open("/home/etudiant/Documents/mon_tube", O_RDONLY);
    
    while (read(ouioui, &c, taille) > 0){
        if ((c >= 'a') && (c <= 'z')) {
            c = c - 'a' + 'A';
        }
        putchar(c);
    }
    
    close(ouioui);
    return 0;
}