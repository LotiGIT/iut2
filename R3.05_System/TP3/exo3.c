#include <stdlib.h>

int main() {
    system ("ps -wafu");
    return EXIT_SUCCESS;
}

// gcc -Wall exo3.c -o exe && ./exe