#include <stdint.h>
#include "values.h"

int main(int argc, char *argv[]){
	uint32_t start_time_h = 0, start_time_l = 0, finish_time_h = 0, finish_time_l = 0, \
	total_time_h = 0, total_time_l = 0, res = 0;

	asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
	asm volatile("csrr %0, mcycle" : "=r"(start_time_l));

	for(int i = 0; i < ORDER; i++){
		asm volatile("fir_coeff_st %0, %1, %2" : "=r"(res) : "r"(coeffs[i]), "r"(i));
		asm volatile("fir_data_st %0, %1, zero" : "=r"(res) : "r"(data[i]));	
	}

	asm volatile("fir_exec %0, zero, zero" : "=r"(res));

	//for(int i = 0; i < ORDER; i++)
	//	res += coeffs[i] * data[ORDER - 1 - i];

	
	asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
	asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));

	total_time_h = finish_time_h - start_time_h;
	total_time_l = finish_time_l - start_time_l;

	return 0;
}
