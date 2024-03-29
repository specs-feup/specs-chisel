#include <stdint.h>
#include <stdio.h>

#if TYPE == 0 
		#include "include/unsigned_values.h" 
#elif TYPE == 1 
		#include "include/signed_values.h" 
#elif TYPE == 2 || TYPE == 3
		#include "include/fixed_point_values.h" 
#endif

int main(int argc, char *argv[]){
	#if TYPE == 0 || TYPE == 1 || TYPE == 2 || TYPE == 3
		static uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
		total_time_h, total_time_l;

		static uint32_t res;

		asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(start_time_l));
		for(int i = 0; i < ORDER; i++){
			asm volatile("fir_coeff_st %0, %1, %2" : "=r"(res) : "r"(coeffs[i]), "r"(i));
		}
		for(int i = 0; i < DATA; i++){
			asm volatile("fir_data_st %0, %1" : "=r"(res) : "r"(data[i]));			
			asm volatile("fir_exec %0" : "=r"(res));
		/*#if TYPE == 3
			printf("Res is --> %d\n", res/(1 << BINARYPOINT));
		#else
			printf("Res is --> %d\n", res);
		#endif*/
			
		}

		asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));
		total_time_h = finish_time_h - start_time_h;
		total_time_l = finish_time_l - start_time_l;
		printf("%d\n", total_time_l);
	#endif
	return 0;
}
