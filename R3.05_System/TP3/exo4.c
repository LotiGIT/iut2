#include <stdlib.h>
#include <stdio.h>

int main() {
    printf("Avant \n");
    system ("cd /home && ls -l | wc");
    printf("Apres \n");
    system(sleep(5));
    return EXIT_SUCCESS;
}

// gcc -Wall exo4.c -o exe && ./exe