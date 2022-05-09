#include <stdint.h>
#include <stdio.h>

#if WIDTH == 8 
	#if TYPE == 4 || TYPE == 5 
		#include "width_8/complex_values.h" 
	#endif 
#elif WIDTH == 16 
	#if TYPE == 4 || TYPE == 5 
		#include "width_16/complex_values.h" 
	#endif 
#elif WIDTH == 32 
	#if TYPE == 4 || TYPE == 5 
		#include "width_32/complex_values.h" 
	#endif 
#endif

int main(int argc, char *argv[]){
	#if TYPE == 4 || TYPE == 5
		uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
		total_time_h, total_time_l;
		uint32_t res, coeff_complex, data_complex;

		asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(start_time_l));
		for(int i = 0; i < ORDER; i++){
			coeff_complex = (uint32_t)(((int32_t)coeffs_real[i] << 16) | ((uint32_t)coeffs_imag[i] & 0xFFFF));
			asm volatile("fir_coeff_st %0, %1, %2" : "=r"(res) : "r"(coeff_complex), "r"(i));
		}
		for(int i = 0; i < DATA; i++){
			data_complex = (uint32_t)(((int32_t)data_real[i] << 16) | ((uint32_t)data_imag[i] & 0xFFFF));
			asm volatile("fir_data_st %0, %1" : "=r"(res) : "r"(data_complex));
			asm volatile("fir_exec %0" : "=r"(res));
			printf("Real part --> %d\n", (uint16_t)(res >> 16));
			printf("Imag part --> %d\n", (uint16_t)res);
			//printf("Res is --> %d\n", res);
		}

		asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));
		total_time_h = finish_time_h - start_time_h;
		total_time_l = finish_time_l - start_time_l;

		//printf("Result is --> %d\n", res);

		printf("%d \n", total_time_l);
	#endif
	return 0;
}
