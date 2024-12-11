#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>



int main(){
    int file = open("mon_tube", O_RDONLY);
    char c;
    while(read(file, &c, 1) > 0){
        if ((c >= 'a') && (c <= 'z')) {
            c = c - 'a' + 'A';
        }
        printf("%c", c);
    }
    close(file);
    return 0;
}