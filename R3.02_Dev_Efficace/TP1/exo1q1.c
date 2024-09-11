#include <stdlib.h>
#include <stdio.h>

int main(){
    int x = 100;
    int *pt;

    pt = &x;
    *pt = *pt+10;

    printf("x=%d (*pt)=%d \n", x, *pt);

    return 0;

}