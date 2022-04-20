#include <stdint.h>
#include <stdio.h>
#include "values.h"

int main(int argc, char *argv[]){
	uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
	total_time_h, total_time_l, res = 0;
	
	printf("\n##### Baseline program #####\n##### FIR ORDER --> %d #####\n", ORDER);

	asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
	asm volatile("csrr %0, mcycle" : "=r"(start_time_l));

	for(int i = 0; i < DATA_MAX; i++){
		res = 0;
		for(int j = 0; j < ORDER; j++)
			if(i - j >= 0) 
				res += coeffs[j] * data[i - j];
	}
		
	asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
	asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));

	total_time_h = finish_time_h - start_time_h;
	total_time_l = finish_time_l - start_time_l;
	
	printf("Result --> %d\n", res);
	printf("Total time --> %d\n", total_time_l);
	
	printf("##### Ending program #####\n\n");

	return 0;
}
