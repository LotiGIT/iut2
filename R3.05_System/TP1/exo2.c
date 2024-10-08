#include <sys/types.h>
#include <sys/stat.h>
#include <ubistd.h>
#include <stdio.h>

int main(){
    struct stat inode;
    stat("OLD", &inode);

    printf("inode : %lu\n", inode.st_ino);
}