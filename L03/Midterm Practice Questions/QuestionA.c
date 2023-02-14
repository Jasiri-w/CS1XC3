#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int main(){
    int i;
    for (i = -100; i < 10000; i++){
        double a, b;
        a = sqrt(i+100);
        b =  sqrt(i+268);
        if (fabs(a - (int)a) < 0.0001 && fabs(b - (int)b) < 0.0001) {
            printf("%d\n", i);          
        }
    }
    
}
