#include <stdio.h>
#include <stdbool.h>

bool perfect_square(int);

int main(void){
    for(int i = 2;i <= 85;i++){
        if(perfect_square(i+100) && perfect_square(i+268)){
            printf("%i\n", i);
        }
    }
}

bool perfect_square(int num){
    for(int i = 0; i < num; i++)
    {
        if(i*i == num){
            return true;
        }
    }
    return false;
}