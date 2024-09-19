#include <stdlib.h>
#include <stdio.h>


int main(){
    int x = 10;
    int y = 30;
    int *ptr1, *ptr2;
    
    // Q1
    ptr1 = &x;

    //Q2
    y = *ptr1;

    //Q3
    *ptr1 = 50;
        
    //Q4

    ptr2 = ptr1;
}