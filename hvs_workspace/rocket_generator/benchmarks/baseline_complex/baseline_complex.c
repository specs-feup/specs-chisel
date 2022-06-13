#include <stdint.h>
#include <stdio.h>

#if TYPE == 4 || TYPE == 5 
		#include "include/complex_values.h" 
#endif 

int main(int argc, char *argv[]){
	#if TYPE == 4 || TYPE == 5
		uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
		total_time_h, total_time_l;
		#if TYPE == 5
			int32_t intermediate_res_real = 0, intermediate_res_imag = 0;
		#endif


		uint16_t res_real, res_imag;

		asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(start_time_l));
		for(int i = 0; i < DATA; i++){
			res_real = 0;
			res_imag = 0;
			for(int j = 0; j < ORDER; j++){
				if(i - j >= 0){
					#if TYPE == 5
						intermediate_res_real = ((int32_t)((int32_t)coeffs_real[j] * (int32_t)data_real[i - j]) >> BINARYPOINT) - \
							((int32_t)((int32_t)coeffs_imag[j] * (int32_t)data_imag[i - j]) >> BINARYPOINT);
							intermediate_res_imag = ((int32_t)((int32_t)coeffs_real[j] * (int32_t)data_imag[i - j]) >> BINARYPOINT) + \
							((int32_t)((int32_t)coeffs_imag[j] * (int32_t)data_real[i - j]) >> BINARYPOINT);
							res_real += (int16_t)intermediate_res_real;
							res_imag += (int16_t)intermediate_res_imag;
					#else
						res_real += coeffs_real[j] * data_real[i - j] - coeffs_imag[j] * data_imag[i - j];
						res_imag += coeffs_real[j] * data_imag[i - j] + coeffs_imag[j] * data_real[i - j];
					#endif
			}
		}
	//printf("Res is --> %d\n", (uint32_t)(((int32_t)res_real << 16) | ((int16_t)res_imag & 0xFFFF)));
	}

		asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));
		total_time_h = finish_time_h - start_time_h;
		total_time_l = finish_time_l - start_time_l;

		printf("Real part --> %d\n", (uint16_t)res_real); // so imprime a parte inteira
		printf("Imag part --> %d\n", (uint16_t)res_imag);
	//	printf("Result is --> %d\n", (uint32_t)(((int32_t)res_real << 16) | ((int16_t)res_imag & 0xFFFF)));
		printf("%d\n", total_time_l);
	#endif
	return 0;
}
