#include <stdint.h>
#include <stdio.h>
#if WIDTH == 8 
	#if TYPE == 0  
		#include "width_8/unsigned_values.h" 
	#elif TYPE == 1 
		#include "width_8/signed_values.h" 
	#elif TYPE == 2 
		#include "width_8/fixed_point_values.h" 
	#else 
		#include "width_8/float.h" 
	#endif 

#elif WIDTH == 16 
	#if TYPE == 0  
		#include "width_16/unsigned_values.h" 
	#elif TYPE == 1 
		#include "width_16/signed_values.h" 
	#elif TYPE == 2 
		#include "width_16/fixed_point_values.h" 
	#else 
		#include "width_16/float.h" 
	#endif 

#elif WIDTH == 32 
	#if TYPE == 0 
		#include "width_32/unsigned_values.h" 
	#elif TYPE == 1 
		#include "width_32/signed_values.h" 
	#elif TYPE == 2 
		#include "width_32/fixed_point_values.h" 
	#else 
		#include "width_32/float_values.h" 
	#endif 
#endif
		

int main(int argc, char *argv[]){
	#if TYPE == 0 || TYPE == 1 || TYPE == 2 || TYPE == 3
		uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
		total_time_h, total_time_l;
	
		#if TYPE == 3
			static float res;
		#else
			static uint32_t res;
		#endif

		#if TYPE == 2
			static int64_t intermediate_res = 0;
		#endif

			asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
			asm volatile("csrr %0, mcycle" : "=r"(start_time_l));
			for(int i = 0; i < DATA; i++){
				res = 0;
				for(int j = 0; j < ORDER; j++){
				if(i - j >= 0){
					#if TYPE == 2 //softfloat
						intermediate_res = ((int64_t)((int64_t)coeffs[j] * (int64_t)data[i - j]) >> BINARYPOINT);
						res += (int32_t)intermediate_res;				
					#else
						res += coeffs[j] * data[i - j];
					#endif
			}
		}
	}

		asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));
		total_time_h = finish_time_h - start_time_h;
		total_time_l = finish_time_l - start_time_l;	
		printf("%d\n", total_time_l);
	#endif

	return 0;
}
