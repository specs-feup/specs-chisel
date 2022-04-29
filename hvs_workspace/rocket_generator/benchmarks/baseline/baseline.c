#include <stdint.h>
#include <stdio.h>
//#if TYPE == 2
//	#include "values_fp.h"
//#else	
//	#include "values.h"
//#endif
#include "values.h"

int main(int argc, char *argv[]){
	uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
	total_time_h, total_time_l;

	//#if TYPE == 0
		uint32_t res = 0;
	//#elif TYPE == 1
	//	int32_t res = 0;
	//#else
	//	float res = 0;
	//#endif

	asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
	asm volatile("csrr %0, mcycle" : "=r"(start_time_l));

	for(int i = 0; i < DATA; i++){
		res = 0;
		for(int j = 0; j < ORDER; j++)
			if(i - j >= 0) 
				res += coeffs[j] * data[i - j];
	}
		
	asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
	asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));

	total_time_h = finish_time_h - start_time_h;
	total_time_l = finish_time_l - start_time_l;

	printf("Result is -> %d\n", res);
	printf("%d\n", total_time_l);

	return 0;
}
