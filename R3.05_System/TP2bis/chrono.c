#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <signal.h>

int main(){
    int loop;
    // print le PID et le nombre de secondes pendant 10 minutes
    for (loop = 0;loop<600;loop++){
        printf("PID %d - Passage %d\n", getpid(), loop);
        // pause d'une seconde
        sleep(1);
    }
    return 0;
}