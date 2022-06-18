#include<time.h>
#include<stdio.h>
#include<stdlib.h>
#include"float_values.h"
#include<math.h>
#include<string.h>
#define STRLEN 200
#define DATA_MAX 2000
#define COEFF_MAX 1000

int32_t convert(float value, int binarypoint){
	return (int32_t)(round(value * (1 << binarypoint)));
}

int main(int argc, char **argv){
  if(argc != 2){
    printf("Usage: <Command> <binarypoint>");
  }
  int binarypoint = atoi(argv[2]);
  char *str = (char *)malloc(STRLEN);
  snprintf(str, STRLEN, "./fixed_point_values.h");
  FILE *fptr = fopen(str, "w");
	fprintf(fptr, "#define DATA_MAX 2000\n#define COEFF_MAX 1000\n");
  fprintf(fptr, "int%s_t data[DATA_MAX] = {", argv[1]);
  for(int i = 0; i < DATA_MAX; i++){
      if(i != DATA_MAX - 1) fprintf(fptr, "%d,", convert(data[i], binarypoint));
      else fprintf(fptr, "%d};\n", convert(data[i], binarypoint));
  }
	fprintf(fptr, "int%s_t coeffs[COEFF_MAX] = {", argv[1]);
  for(int i = 0; i < COEFF_MAX; i++){
      if(i != COEFF_MAX - 1) fprintf(fptr, "%d,", convert(coeffs[i], binarypoint));
			else fprintf(fptr, "%d};\n", convert(coeffs[i], binarypoint));
  }
	fclose(fptr);
  return 0;
}
