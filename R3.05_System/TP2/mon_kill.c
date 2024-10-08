#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>


int main(int argc, char *argv[], char *envp[]){
    
    // il faut check que argc est bien égal à 2

    int pid = atoi(argv[1]); // c'est un string donc conversion
    
    for (int loop = 0; loop < 600; loop++) {
        printf("PID %d - Passage %d\n", getpid(), loop);
        sleep(1);
    }
    
    if(pid != 0 && loop == 1){
        kill(SIGSTOP, pid); // il faut gérer les erreurs, au cas où ...
    }
    
    return 0;

    
}

