#include <stdint.h>
#include <stdio.h>
#if TYPE == 0 || TYPE == 1 || TYPE == 2
	#include "values.h"
#endif

int main(int argc, char *argv[]){
	#if TYPE == 0 || TYPE == 1 || TYPE == 2
		uint32_t start_time_h, start_time_l, finish_time_h, finish_time_l, \
		total_time_h, total_time_l, res;
		
		#if TYPE == 2
			int64_t intermediate_res = 0;
		#endif

			asm volatile("csrr %0, mcycleh" : "=r"(start_time_h));
			asm volatile("csrr %0, mcycle" : "=r"(start_time_l));
			for(int i = 0; i < DATA; i++){
				res = 0;
				for(int j = 0; j < ORDER; j++)
				if(i - j >= 0){
					#if TYPE == 2
						intermediate_res = ((int64_t)((int64_t)coeffs[j] * (int64_t)data[i - j]) >> BINARYPOINT);
						res += (int32_t)intermediate_res;
					#else
						res += coeffs[j] * data[i - j];
					#endif
			}
	}

		asm volatile("csrr %0, mcycleh" : "=r"(finish_time_h));
		asm volatile("csrr %0, mcycle" : "=r"(finish_time_l));
		total_time_h = finish_time_h - start_time_h;
		total_time_l = finish_time_l - start_time_l;
		printf("Res is --> %d\n", res);
		printf("%d\n", total_time_l);
	#endif

	return 0;
}
