#include <stdint.h>
#include <stdio.h>


#if TYPE == 0 
		#include "include/unsigned_values.h" 
#elif TYPE == 1 
		#include "include/signed_values.h" 
#elif TYPE == 2 
		#include "include/fixed_point_values.h" 
#else 
		#include "include/float_values.h" 
#endif 		

int main(int argc, char *argv[]){
	#if TYPE == 0 || TYPE == 1 || TYPE == 2 || TYPE == 3
		static uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
		total_time_h, total_time_l;
	
		#if TYPE == 3
			 static float res_1, res_2;
		#else
			 static uint32_t res_1, res_2;
		#endif

		uint32_t val_1 = 3, val_2 = -3;
	
		if(val_1 > 0){
			res_1 = val_1; 
		}else{
			res_1 = 0;		
		}
		if(val_2 > 0){
			res_2 = val_2;

		}else{
			res_2 = 0;
		}
		asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));
		total_time_h = finish_time_h - start_time_h;
		total_time_l = finish_time_l - start_time_l;
		printf("res_1 --> %d\n", res_1);
		printf("res_2 --> %d\n", res_2);
		printf("%d\n", total_time_l);
	#endif

	return 0;
}