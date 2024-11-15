#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <signal.h>


// exec -> execl(pathname, arg, ...., NULL)

void sigchld_handler(int signum){
    pid_t p;
    int status;

    if(signum != SIGCHLD){
        printf("erreur");
        EXIT_FAILURE;
    }
}
int main(){

    pid_t pid;
    int x = 0;

    
    pid = fork();
    if(pid == 0){ // Fils

        execl("/usr/bin/xeyes", "xeyes", "-center", "red", NULL);

    
    } else {
        signal()
        for(x;x>0;x++){
            printf("Passage num %d\n", x);
            sleep(1);
        }
    }

}
