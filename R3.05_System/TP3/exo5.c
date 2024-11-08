#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>


int main() {
    pid_t pid;
    int val = 10;
    int i = 0;
    printf("Avant fork(), je suis PID %d", getpid()); 
    printf(" et val = %d\n\n", val); 
    pid = fork(); 
    if (pid == 0) { // Fils 

        
        printf("Je suis le fils, mon PID est %d et mon pere a le PID %d\n", getpid(), getppid());
        printf("Chez le fils, val = %d\n", val);
        val = 20; 
    } else { // Pere 
        printf("Je suis le père, mon PID est %d et je viens de créer un fils de PID %d\n", getpid(), pid);
        
        int status;
        // Le père attend que le fils se termine et récupère son statut
        pid_t terminated_pid = wait(&status);  // Attente de la fin du fils
        
        // Vérification de l'état de terminaison du fils
        if (WIFEXITED(status)) {  // Si le fils s'est terminé normalement
            printf("Le fils (PID %d) est décédé, il a terminé normalement avec le code de sortie %d\n", terminated_pid, WEXITSTATUS(status));
        } else {
            printf("Le fils (PID %d) est décédé, mais il n'a pas terminé normalement.\n", terminated_pid);
        }

        
        for (i; i < 299; i++) {
            printf("passage %d\n", i);
            sleep(1);
        }
        
        printf("Chez le père, val = %d\n", val);
    }

    printf("Je suis PID %d et val = %d\n\n", getpid(), val); 
    return EXIT_SUCCESS; 
}

// gcc -Wall exo5.c -o exe && ./exe