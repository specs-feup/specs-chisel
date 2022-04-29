#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>
#include<stdint.h>
#include<math.h>
#include<assert.h>
#define STRLEN 99 
#define DATA_MAX 2000
#define COEFF_MAX 1000


uint32_t convert(float value, int binarypoint){
	return (uint32_t)(round(value * (1 << binarypoint)));
}

int main(int argc, char **argv){
  assert(argc == 3);
  int binarypoint = atoi(argv[2]);
  FILE *fptr = fopen("values.h", "w");
  float val = 0.0;
  char *str = (char *)malloc(STRLEN);
  FILE *fptr_fp = fopen("values_fp.h", "w");
  char *str_fp = (char *)malloc(STRLEN);
  srand(time(NULL));
  strcpy(str, "#define DATA_MAX 2000\n#define COEFF_MAX 1000\n");
  fwrite(str, sizeof(char), strlen(str), fptr);
  memset((void *)str, 0, STRLEN);
  switch(atoi(argv[1])){
	case 0:
		strcpy(str, "uint32_t data[DATA_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		for(int i = 0; i < DATA_MAX; i++){
			memset((void *)str, 0, STRLEN);
			int val = rand() % 100 + 1;
			if(i != DATA_MAX - 1) sprintf(str, "%d, ", val);
			else sprintf(str, "%d };", val);
			fwrite(str, sizeof(char), strlen(str), fptr);
		}
		fwrite("\n", sizeof(char), strlen("\n"), fptr);
		memset((void *)str, 0, STRLEN);
		strcpy(str, "uint32_t coeffs[COEFF_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		for(int i = 0; i < COEFF_MAX; i++){
			memset((void *)str, 0, STRLEN);
			int val = rand() % 100 + 1;
			if(i != COEFF_MAX - 1) sprintf(str, "%d, ", val);
			else sprintf(str, "%d };", val);
			fwrite(str, sizeof(char), strlen(str), fptr);
		}
	break;
	case 1:
		strcpy(str, "int32_t data[DATA_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		for(int i = 0; i < DATA_MAX; i++){
			memset((void *)str, 0, STRLEN);
			int val = rand() % 100 + 1 - 50;
			if(i != DATA_MAX - 1) sprintf(str, "%d, ", val);
			else sprintf(str, "%d };", val);
			fwrite(str, sizeof(char), strlen(str), fptr);
		}
		fwrite("\n", sizeof(char), strlen("\n"), fptr);
		memset((void *)str, 0, STRLEN);
		strcpy(str, "int32_t coeffs[COEFF_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		for(int i = 0; i < COEFF_MAX; i++){
			memset((void *)str, 0, STRLEN);
			int val = rand() % 100 + 1 - 50;
			if(i != COEFF_MAX - 1) sprintf(str, "%d, ", val);
			else sprintf(str, "%d };", val);
			fwrite(str, sizeof(char), strlen(str), fptr);
		}

	break;
	case 2:
		strcpy(str_fp, "#define DATA_MAX 2000\n#define COEFF_MAX 1000\n");
  		fwrite(str_fp, sizeof(char), strlen(str_fp), fptr_fp);
  		memset((void *)str_fp, 0, STRLEN);
		strcpy(str_fp, "float data[DATA_MAX] = { ");
		strcpy(str, "uint32_t data[DATA_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		fwrite(str_fp, sizeof(char), strlen(str_fp), fptr_fp);
		for(int i = 0; i < DATA_MAX; i++){
			memset((void *)str, 0, STRLEN);
			float val = (float)((float)rand()/(float)(RAND_MAX) * 100);
			uint32_t con_val = convert(val, binarypoint);
			if(i != DATA_MAX - 1){
				sprintf(str_fp, "%f, ", val);
				sprintf(str, "%d, ", con_val);
			} 
			else{
				sprintf(str_fp, "%f };", val);
				sprintf(str, "%d };", con_val);			
			} 
			fwrite(str_fp, sizeof(char), strlen(str_fp), fptr_fp);
			fwrite(str, sizeof(char), strlen(str), fptr);
			
		}
		fwrite("\n", sizeof(char), strlen("\n"), fptr);
		fwrite("\n", sizeof(char), strlen("\n"), fptr_fp);
		memset((void *)str, 0, STRLEN);
		memset((void *)str_fp, 0, STRLEN);
		strcpy(str, "uint32_t coeffs[COEFF_MAX] = { ");
		strcpy(str_fp, "float coeffs[COEFF_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		fwrite(str_fp, sizeof(char), strlen(str_fp), fptr_fp);
		for(int i = 0; i < COEFF_MAX; i++){
			memset((void *)str, 0, STRLEN);
			float val = (float)((float)rand()/(float)(RAND_MAX) * 100);
			uint32_t con_val = convert(val, binarypoint);
			if(i != COEFF_MAX - 1){
				sprintf(str_fp, "%f, ", val);
				sprintf(str, "%d, ", con_val);
			} 
			else{
				sprintf(str_fp, "%f };", val);
				sprintf(str, "%d };", con_val);	
			}
			fwrite(str_fp, sizeof(char), strlen(str_fp), fptr_fp); 
			fwrite(str, sizeof(char), strlen(str), fptr);
		}

	break;
}
  return 0;
}
