#include <stdio.h>
#include <stdbool.h>

bool perfect_square(int);

int main(void){
    for(int i = 1; i <= 1000; i++){
        if(perfect_square(i)){
            printf("%i\n",i);
        }
    }
    return 0;
}

bool perfect_square(int num){
    int sum = 0;
    for(int i = 1; i < num; i++){
        // printf("Remainder: %i", num%i);
        if(num % i == 0){ // Divisible
            sum += i; // Add the factor to a sum
        }
    }
    if(sum == num){ // "Perfect if the sum of factors is equal to the number"
        return true;
    }
    return false;
}