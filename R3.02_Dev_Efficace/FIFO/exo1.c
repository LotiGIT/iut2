#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct {
    char nom[50];
    int age;
}tpersonne;


typedef struct elem{
    tpersonne pers;
    struct elem* svt;
}telement;



typedef struct{
    telement* queue;
    telement* tete;
}tfile; 