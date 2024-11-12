#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(){
    int *pt, x;
    x = 100;
    pt = (int*)malloc(sizeof(int));
    *pt = x;
    pt = &x;
    *pt += 10;
    printf("\nx= %d\n(*pt)= %d\n", x, *pt);

    return 0;
}
