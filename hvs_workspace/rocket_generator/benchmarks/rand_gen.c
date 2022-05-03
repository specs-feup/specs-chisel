#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>
#include<stdint.h>
#include<math.h>
#include<assert.h>
#define STRLEN 200
#define DATA_MAX 2000
#define COEFF_MAX 1000
#define DATA_MAX_REAL 1000
#define DATA_MAX_IMAG 1000
#define COEFF_MAX_REAL 500
#define COEFF_MAX_IMAG 500


int32_t convert(float value, int binarypoint){
	return (int32_t)(round(value * (1 << binarypoint)));
}

int main(int argc, char **argv){
  assert(argc == 3);
  int binarypoint = atoi(argv[2]);
  FILE *fptr = fopen("values.h", "w");
	FILE *fptr_complex = fopen("complex_values.h", "w");
  float val = 0.0;
  char *str = (char *)malloc(STRLEN);
  srand(time(NULL));
  strcpy(str, "#define DATA_MAX_REAL 1000\n#define DATA_MAX_IMAG 1000\n#define COEFF_MAX_REAL 500\n#define COEFF_MAX_IMAG 500\n");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	memset((void *)str, 0, STRLEN);
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
		strcpy(str, "int32_t data[DATA_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		for(int i = 0; i < DATA_MAX; i++){
			memset((void *)str, 0, STRLEN);
			float val = (float)((float)rand()/(float)(RAND_MAX) * 100 - 50);
			int32_t con_val = convert(val, binarypoint);
			if(i != DATA_MAX - 1) sprintf(str, "%d, ", con_val);
			else sprintf(str, "%d };", con_val);
			fwrite(str, sizeof(char), strlen(str), fptr);

		}
		fwrite("\n", sizeof(char), strlen("\n"), fptr);
		memset((void *)str, 0, STRLEN);
		strcpy(str, "int32_t coeffs[COEFF_MAX] = { ");
		fwrite(str, sizeof(char), strlen(str), fptr);
		for(int i = 0; i < COEFF_MAX; i++){
			memset((void *)str, 0, STRLEN);
			float val = (float)((float)rand()/(float)(RAND_MAX) * 100 - 50);
			int32_t con_val = convert(val, binarypoint);
			if(i != COEFF_MAX - 1) sprintf(str, "%d, ", con_val);
			else sprintf(str, "%d };", con_val);
			fwrite(str, sizeof(char), strlen(str), fptr);
		}
	break;
	case 3:
	//TODO --> Floating point
	break;
	case 4:
	strcpy(str, "int16_t data_real[DATA_MAX_REAL] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < DATA_MAX_REAL; i++){
		memset((void *)str, 0, STRLEN);
		int val_real = rand() % 100 + 1 - 50;
		if(i != DATA_MAX_REAL - 1) sprintf(str, "%d, ", val_real);
		else sprintf(str, "%d };", val_real);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	fwrite("\n", sizeof(char), strlen("\n"), fptr_complex);
	memset((void *)str, 0, STRLEN);
	strcpy(str, "int16_t data_imag[DATA_MAX_IMAG] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < DATA_MAX_IMAG; i++){
		memset((void *)str, 0, STRLEN);
		int val_imag = rand() % 100 + 1 - 50;
		if(i != DATA_MAX_IMAG - 1) sprintf(str, "%d, ", val_imag);
		else sprintf(str, "%d };", val_imag);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	fwrite("\n", sizeof(char), strlen("\n"), fptr_complex);
	memset((void *)str, 0, STRLEN);
	strcpy(str, "int16_t coeffs_real[COEFF_MAX_REAL] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < COEFF_MAX_REAL; i++){
		memset((void *)str, 0, STRLEN);
		int val_real = rand() % 100 + 1 - 50;
		if(i != COEFF_MAX_REAL - 1) sprintf(str, "%d, ", val_real);
		else sprintf(str, "%d };", val_real);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	fwrite("\n", sizeof(char), strlen("\n"), fptr_complex);
	memset((void *)str, 0, STRLEN);
	strcpy(str, "int16_t coeffs_imag[COEFF_MAX_IMAG] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < COEFF_MAX_REAL; i++){
		memset((void *)str, 0, STRLEN);
		int val_imag = rand() % 100 + 1 - 50;
		if(i != COEFF_MAX_REAL - 1) sprintf(str, "%d, ", val_imag);
		else sprintf(str, "%d };", val_imag);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	break;


	case 5:
	strcpy(str, "int16_t data_real[DATA_MAX_REAL] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < DATA_MAX_REAL; i++){
		memset((void *)str, 0, STRLEN);
		int val_real = convert(rand() % 100 + 1 - 50, binarypoint);
		if(i != DATA_MAX_REAL - 1) sprintf(str, "%d, ", val_real);
		else sprintf(str, "%d };", val_real);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	fwrite("\n", sizeof(char), strlen("\n"), fptr_complex);
	memset((void *)str, 0, STRLEN);
	strcpy(str, "int16_t data_imag[DATA_MAX_IMAG] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < DATA_MAX_IMAG; i++){
		memset((void *)str, 0, STRLEN);
		int val_imag = convert(rand() % 100 + 1 - 50, binarypoint);
		if(i != DATA_MAX_IMAG - 1) sprintf(str, "%d, ", val_imag);
		else sprintf(str, "%d };", val_imag);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	fwrite("\n", sizeof(char), strlen("\n"), fptr_complex);
	memset((void *)str, 0, STRLEN);
	strcpy(str, "int16_t coeffs_real[COEFF_MAX_REAL] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < COEFF_MAX_REAL; i++){
		memset((void *)str, 0, STRLEN);
		int val_real = convert(rand() % 100 + 1 - 50, binarypoint);
		if(i != COEFF_MAX_REAL - 1) sprintf(str, "%d, ", val_real);
		else sprintf(str, "%d };", val_real);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	fwrite("\n", sizeof(char), strlen("\n"), fptr_complex);
	memset((void *)str, 0, STRLEN);
	strcpy(str, "int16_t coeffs_imag[COEFF_MAX_IMAG] = { ");
	fwrite(str, sizeof(char), strlen(str), fptr_complex);
	for(int i = 0; i < COEFF_MAX_REAL; i++){
		memset((void *)str, 0, STRLEN);
		int val_imag = convert(rand() % 100 + 1 - 50, binarypoint);
		if(i != COEFF_MAX_REAL - 1) sprintf(str, "%d, ", val_imag);
		else sprintf(str, "%d };", val_imag);
		fwrite(str, sizeof(char), strlen(str), fptr_complex);
	}

	break;
}
  return 0;
}
