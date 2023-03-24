#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

int main(void){
	int arr[10];
	bool falsity = true;

	if(falsity){
		falsity++;
	}else if(falsity){
		falsity++;
	}

	float d = 10/0;

	falsity++;
	arr[1] = 3;
	arr[11]= 4;
}
