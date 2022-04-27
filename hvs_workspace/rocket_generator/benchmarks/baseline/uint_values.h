#define DATA_MAX 2000
#define COEFF_MAX 1000
#if WIDTH == 32
uint32_t data[DATA_MAX] = { 75, 22, 31, 98, 21, 30, 85, 72, 83, 2, 58, 14, 84, 79, 65, 51, 69, 54, 75, 94, 74, 91, 87, 26, 35, 8, 37, 14, 73, 55, 13, 47, 76, 44, 97, 96, 73, 33, 19, 55, 34, 28, 69, 69, 7, 85, 71, 75, 91, 45, 21, 16, 87, 7, 94, 21, 14, 30, 34, 39, 36, 47, 85, 63, 90, 33, 10, 14, 17, 80, 21, 50, 7, 41, 70, 65, 77, 92, 92, 19, 88, 12, 35, 74, 70, 28, 47, 35, 9, 80, 73, 96, 78, 10, 58, 19, 42, 19, 85, 59, 98, 57, 60, 56, 97, 82, 21, 25, 73, 12, 44, 61, 23, 78, 86, 44, 57, 32, 78, 65, 64, 3, 60, 41, 12, 69, 12, 5, 87, 48, 63, 84, 4, 75, 39, 52, 8, 59, 76, 80, 22, 19, 92, 44, 96, 78, 39, 4, 9, 17, 68, 72, 19, 79, 65, 82, 47, 28, 86, 33, 75, 1, 68, 78, 75, 59, 81, 82, 17, 56, 13, 39, 75, 57, 34, 22, 34, 25, 26, 94, 41, 45, 66, 11, 24, 82, 44, 70, 9, 29, 55, 35, 29, 74, 64, 55, 32, 44, 88, 1, 99, 1, 39, 25, 9, 24, 99, 42, 48, 24, 87, 40, 20, 4, 2, 43, 85, 45, 65, 45, 74, 71, 79, 54, 44, 42, 9, 76, 37, 96, 76, 36, 48, 66, 12, 56, 41, 10, 49, 89, 33, 36, 80, 5, 39, 34, 47, 76, 78, 63, 20, 3, 33, 51, 57, 77, 44, 17, 4, 81, 64, 79, 68, 64, 44, 79, 71, 36, 89, 20, 24, 73, 7, 56, 77, 97, 89, 76, 72, 18, 38, 44, 21, 23, 46, 29, 99, 89, 45, 54, 21, 60, 32, 88, 23, 27, 67, 94, 62, 7, 65, 38, 31, 23, 93, 60, 19, 33, 35, 43, 50, 24, 38, 70, 46, 83, 50, 96, 23, 94, 49, 44, 6, 80, 83, 28, 58, 49, 73, 20, 7, 89, 9, 38, 11, 53, 97, 82, 85, 83, 76, 86, 6, 65, 56, 52, 47, 57, 47, 21, 51, 96, 16, 8, 27, 99, 87, 85, 99, 60, 56, 6, 100, 64, 95, 63, 16, 43, 96, 52, 25, 71, 37, 82, 35, 44, 33, 33, 1, 32, 5, 3, 27, 21, 10, 5, 19, 96, 89, 17, 7, 96, 74, 59, 11, 68, 21, 78, 62, 16, 29, 38, 38, 18, 20, 24, 61, 52, 8, 13, 35, 12, 67, 61, 32, 76, 18, 2, 24, 6, 71, 82, 54, 44, 40, 64, 12, 60, 42, 25, 27, 22, 63, 16, 39, 82, 39, 52, 85, 46, 64, 20, 10, 31, 32, 41, 58, 49, 95, 33, 7, 65, 15, 60, 8, 54, 75, 71, 66, 16, 96, 44, 38, 10, 60, 28, 91, 50, 79, 75, 96, 43, 46, 5, 25, 78, 97, 34, 26, 91, 67, 84, 7, 81, 43, 15, 86, 70, 37, 3, 85, 84, 99, 74, 93, 58, 2, 83, 7, 32, 10, 54, 74, 55, 10, 50, 32, 7, 84, 10, 49, 2, 45, 56, 82, 40, 22, 19, 9, 58, 74, 93, 42, 72, 19, 34, 81, 72, 69, 87, 3, 78, 93, 29, 84, 2, 30, 68, 60, 13, 29, 61, 14, 73, 68, 47, 12, 89, 18, 20, 98, 91, 65, 91, 14, 83, 77, 94, 6, 45, 32, 8, 74, 24, 88, 57, 78, 18, 24, 89, 30, 52, 49, 96, 25, 16, 94, 36, 4, 63, 8, 54, 5, 72, 44, 18, 6, 20, 11, 11, 16, 95, 70, 89, 18, 58, 98, 47, 75, 21, 36, 56, 25, 84, 3, 1, 52, 49, 88, 7, 63, 95, 60, 68, 18, 56, 85, 23, 75, 48, 85, 43, 42, 55, 83, 11, 64, 80, 10, 38, 53, 97, 45, 29, 80, 100, 29, 83, 48, 16, 90, 10, 63, 49, 29, 80, 4, 66, 55, 31, 13, 39, 73, 6, 93, 7, 68, 8, 87, 29, 97, 91, 25, 42, 19, 57, 41, 99, 39, 40, 66, 28, 1, 28, 77, 30, 60, 32, 95, 14, 62, 59, 52, 86, 16, 97, 93, 35, 4, 31, 64, 1, 73, 88, 94, 91, 96, 86, 41, 35, 25, 6, 14, 77, 34, 42, 6, 93, 74, 52, 58, 87, 62, 9, 25, 77, 5, 69, 64, 61, 51, 27, 61, 23, 66, 54, 65, 14, 91, 5, 48, 15, 10, 61, 43, 95, 3, 49, 39, 28, 52, 96, 14, 14, 5, 90, 42, 61, 58, 5, 73, 8, 83, 33, 30, 1, 38, 94, 14, 28, 98, 61, 94, 60, 73, 37, 54, 27, 37, 93, 6, 40, 88, 72, 53, 44, 61, 47, 57, 19, 51, 29, 78, 86, 14, 8, 86, 3, 53, 99, 31, 3, 11, 76, 62, 35, 64, 15, 62, 100, 59, 67, 40, 99, 38, 44, 94, 51, 90, 50, 69, 93, 31, 46, 30, 44, 5, 15, 46, 10, 65, 28, 12, 75, 4, 73, 9, 19, 39, 22, 19, 98, 41, 10, 48, 30, 53, 41, 80, 95, 91, 100, 39, 73, 98, 20, 16, 54, 34, 13, 63, 50, 93, 74, 76, 48, 98, 36, 66, 37, 58, 84, 86, 50, 45, 33, 79, 98, 73, 11, 44, 15, 62, 34, 87, 59, 53, 54, 13, 38, 67, 27, 87, 59, 1, 14, 6, 98, 49, 71, 86, 58, 7, 23, 7, 51, 55, 38, 100, 80, 100, 95, 46, 61, 28, 33, 20, 32, 86, 84, 69, 4, 10, 7, 14, 62, 20, 71, 12, 21, 94, 97, 78, 100, 20, 37, 2, 26, 74, 2, 57, 73, 48, 3, 85, 76, 35, 4, 59, 72, 39, 80, 28, 49, 86, 93, 10, 58, 64, 73, 30, 57, 70, 7, 8, 41, 43, 9, 18, 68, 62, 75, 92, 10, 77, 77, 37, 11, 32, 95, 34, 71, 74, 13, 71, 12, 6, 32, 21, 69, 5, 2, 77, 26, 8, 36, 66, 3, 96, 83, 22, 58, 57, 66, 19, 85, 94, 7, 47, 25, 1, 81, 47, 27, 45, 69, 90, 50, 1, 62, 70, 57, 63, 46, 82, 22, 33, 99, 76, 29, 81, 98, 38, 90, 15, 56, 74, 8, 62, 73, 84, 14, 53, 31, 92, 97, 99, 81, 99, 51, 94, 68, 7, 8, 66, 88, 30, 98, 86, 57, 26, 19, 6, 63, 60, 20, 70, 85, 27, 31, 57, 11, 97, 61, 93, 88, 10, 43, 21, 8, 94, 14, 27, 100, 74, 92, 40, 55, 42, 77, 11, 67, 47, 17, 82, 6, 36, 51, 43, 15, 34, 51, 77, 30, 12, 69, 69, 73, 11, 89, 32, 4, 55, 58, 56, 28, 50, 47, 82, 43, 23, 92, 61, 70, 60, 42, 27, 96, 45, 21, 62, 30, 72, 38, 11, 35, 58, 79, 59, 68, 68, 90, 24, 22, 47, 31, 1, 48, 77, 82, 90, 99, 25, 51, 20, 37, 44, 99, 84, 40, 19, 45, 21, 42, 82, 31, 28, 39, 62, 86, 58, 29, 75, 33, 2, 74, 63, 54, 21, 39, 87, 63, 90, 63, 65, 9, 99, 8, 59, 82, 100, 30, 26, 20, 71, 59, 3, 51, 49, 64, 36, 59, 44, 63, 91, 97, 36, 54, 50, 8, 92, 36, 70, 33, 98, 34, 94, 49, 94, 52, 30, 45, 81, 8, 64, 4, 66, 18, 54, 67, 81, 41, 25, 76, 3, 15, 72, 90, 20, 73, 98, 12, 8, 19, 96, 58, 5, 89, 6, 50, 41, 87, 94, 21, 94, 9, 76, 12, 27, 29, 78, 59, 70, 54, 35, 24, 68, 58, 66, 88, 31, 15, 51, 90, 33, 46, 99, 89, 35, 4, 38, 75, 43, 31, 47, 36, 92, 23, 47, 70, 3, 76, 28, 24, 29, 14, 100, 97, 72, 65, 36, 2, 79, 38, 91, 11, 83, 90, 52, 69, 45, 89, 95, 87, 72, 94, 75, 63, 16, 73, 32, 70, 49, 59, 94, 77, 25, 93, 25, 96, 9, 12, 97, 87, 49, 39, 49, 84, 80, 100, 4, 25, 89, 99, 63, 12, 92, 89, 74, 59, 62, 57, 80, 10, 67, 73, 38, 91, 17, 63, 86, 25, 26, 34, 63, 75, 73, 64, 10, 52, 63, 13, 28, 3, 63, 43, 14, 54, 31, 39, 64, 92, 95, 44, 53, 62, 68, 91, 52, 37, 5, 90, 13, 30, 23, 28, 56, 47, 91, 65, 51, 53, 78, 78, 8, 40, 72, 21, 46, 55, 12, 61, 98, 6, 56, 51, 19, 76, 93, 71, 12, 97, 12, 76, 78, 34, 3, 34, 81, 93, 98, 31, 98, 27, 60, 5, 19, 84, 77, 16, 38, 40, 76, 35, 46, 32, 37, 64, 7, 29, 86, 70, 77, 97, 45, 55, 83, 100, 88, 15, 92, 37, 97, 41, 64, 8, 97, 34, 91, 74, 49, 80, 65, 24, 67, 10, 7, 3, 26, 13, 84, 63, 34, 60, 12, 31, 14, 94, 30, 1, 8, 73, 90, 56, 14, 53, 63, 10, 38, 54, 35, 86, 85, 52, 9, 51, 61, 16, 54, 38, 80, 37, 1, 66, 96, 12, 96, 62, 57, 25, 14, 16, 49, 3, 71, 14, 7, 33, 76, 44, 38, 62, 29, 23, 13, 90, 73, 74, 57, 78, 63, 88, 66, 63, 53, 14, 26, 48, 75, 34, 24, 40, 49, 73, 43, 71, 38, 1, 4, 13, 45, 93, 75, 25, 67, 87, 14, 92, 12, 22, 69, 75, 10, 87, 89, 62, 100, 67, 10, 26, 100, 85, 65, 1, 9, 59, 71, 47, 60, 26, 59, 4, 19, 85, 80, 85, 24, 94, 28, 35, 15, 49, 61, 76, 35, 2, 38, 86, 68, 99, 11, 67, 83, 75, 19, 44, 34, 90, 90, 93, 15, 100, 48, 33, 37, 27, 70, 60, 72, 49, 94, 39, 97, 7, 14, 31, 8, 3, 16, 75, 1, 78, 93, 36, 53, 12, 79, 38, 53, 20, 82, 67, 71, 81, 52, 7, 59, 73, 18, 31, 21, 64, 21, 18, 70, 86, 100, 77, 89, 16, 3, 89, 93, 47, 24, 97, 10, 54, 86, 62, 73, 67, 29, 96, 99, 32, 2, 58, 4, 72, 88, 24, 35, 60, 93, 4, 45, 93, 32, 33, 8, 34, 22, 52, 32, 97, 1, 42, 51, 86, 3, 75, 5, 83, 70, 3, 14, 24, 12, 17, 95, 51, 93, 29, 10, 85, 84, 55, 77, 15, 39, 36, 48, 12, 88, 31, 9, 40, 72, 11, 25, 75, 85, 81, 57, 7, 36, 23, 30, 47, 39, 76, 98, 31, 4, 59, 68, 87, 13, 44, 53, 4, 80, 52, 15, 19, 82, 23, 58, 54, 85, 34, 28, 70, 15, 36, 28, 2, 58, 9, 48, 49, 84, 97, 31, 39, 56, 98, 77, 20, 42, 29, 23, 73, 80, 38, 43, 61, 12, 52, 14, 97, 85, 93, 18, 51, 81, 45, 52, 90, 5, 52, 38, 88, 100, 69, 26, 55, 18, 54, 27, 59, 82, 49, 83, 13, 38, 77, 73, 2, 28, 39, 98, 13, 83, 67, 15, 15, 63, 19, 5, 67, 22, 94, 54, 21, 14, 31, 28, 32, 36, 54, 42, 17, 54, 77, 81, 44, 53, 5, 45, 81, 43, 94, 45, 78, 60, 59, 44, 22, 29, 100, 88, 50, 94, 93, 23, 7, 75, 2, 90, 10, 7, 32, 78, 60, 8, 58, 55, 60, 62, 99, 92, 57, 92, 36, 86, 3, 47, 29, 24, 27, 29, 63, 29, 74, 7, 51, 32, 81, 52, 22, 42, 58, 5, 71, 69, 64, 28, 76, 23, 42, 74, 67, 98, 18, 2, 35, 72, 100, 63, 96, 27, 43, 10, 55, 68, 69, 57, 100, 1, 60, 73, 43, 69, 77, 13, 37, 40, 93, 12, 14, 34, 38, 80, 83, 7, 34, 17, 78, 33, 31, 25, 11, 74, 87, 65, 93, 55, 21, 92, 55, 80, 64, 49, 48, 92, 14, 37, 31, 6, 100, 97, 91, 89, 28, 73, 95, 13, 41, 25, 46, 71, 49, 8, 96, 87, 73, 89, 41, 45, 32, 96, 77, 96, 96, 76, 39, 9, 64};
uint32_t coeffs[COEFF_MAX] = {   1, 86, 77, 17, 99, 35, 72, 63, 45, 99, 98, 26, 32, 78, 64, 73, 24, 59, 6, 97, 29, 40, 26, 96, 29, 4, 43, 54, 48, 99, 69, 48, 36, 45, 17, 34, 80, 88, 96, 76, 87, 45, 2, 70, 22, 17, 43, 98, 75, 100, 94, 56, 39, 71, 51, 19, 74, 93, 24, 73, 44, 92, 20, 79, 89, 36, 65, 20, 76, 60, 47, 14, 57, 100, 35, 78, 17, 29, 27, 43, 28, 20, 98, 18, 42, 1, 36, 67, 93, 12, 39, 88, 55, 11, 19, 43, 98, 83, 14, 25, 94, 61, 38, 50, 60, 25, 80, 76, 53, 6, 19, 33, 78, 68, 50, 19, 68, 38, 86, 13, 49, 76, 100, 3, 86, 18, 98, 84, 52, 11, 8, 46, 71, 98, 47, 31, 22, 26, 58, 26, 32, 28, 58, 61, 96, 60, 79, 63, 49, 16, 75, 97, 92, 27, 51, 29, 96, 100, 12, 48, 11, 72, 93, 33, 69, 39, 15, 42, 17, 73, 19, 48, 52, 77, 60, 47, 88, 90, 62, 36, 6, 88, 84, 49, 14, 86, 77, 10, 86, 41, 57, 96, 12, 1, 28, 32, 39, 43, 73, 7, 67, 43, 6, 18, 71, 65, 17, 58, 55, 78, 45, 60, 65, 28, 60, 31, 14, 88, 40, 99, 28, 48, 46, 91, 48, 73, 22, 38, 67, 46, 45, 33, 89, 50, 3, 59, 15, 19, 69, 21, 48, 13, 32, 12, 41, 91, 94, 6, 78, 33, 56, 58, 32, 1, 48, 79, 25, 22, 69, 92, 19, 65, 76, 59, 14, 78, 18, 80, 48, 38, 52, 95, 50, 83, 59, 42, 73, 52, 47, 3, 85, 54, 12, 68, 54, 11, 99, 79, 32, 67, 22, 3, 31, 49, 61, 96, 27, 30, 28, 26, 67, 79, 21, 69, 62, 79, 10, 86, 30, 9, 40, 66, 62, 51, 34, 16, 62, 84, 46, 45, 50, 67, 47, 32, 15, 60, 79, 93, 89, 58, 19, 8, 89, 91, 76, 2, 69, 85, 87, 50, 93, 27, 16, 7, 77, 1, 74, 90, 84, 19, 35, 85, 37, 81, 68, 3, 40, 46, 48, 81, 56, 66, 88, 44, 8, 63, 45, 76, 99, 83, 25, 44, 9, 92, 50, 38, 92, 23, 27, 27, 93, 13, 11, 29, 94, 78, 83, 85, 76, 30, 17, 83, 47, 4, 26, 54, 18, 22, 29, 17, 4, 6, 12, 65, 49, 13, 2, 93, 87, 80, 19, 79, 93, 82, 7, 38, 11, 89, 74, 38, 71, 91, 20, 17, 46, 97, 71, 64, 18, 51, 32, 22, 8, 95, 38, 57, 7, 39, 49, 93, 70, 19, 71, 14, 52, 29, 51, 63, 69, 77, 52, 39, 67, 72, 56, 12, 20, 78, 27, 38, 28, 10, 11, 36, 4, 48, 44, 62, 38, 44, 54, 7, 14, 76, 73, 66, 56, 23, 80, 77, 99, 31, 15, 17, 54, 22, 81, 74, 51, 59, 11, 79, 69, 73, 66, 24, 20, 61, 86, 9, 4, 91, 67, 17, 19, 39, 82, 74, 14, 13, 50, 12, 44, 17, 81, 97, 90, 61, 22, 41, 71, 32, 71, 39, 56, 88, 15, 27, 48, 52, 35, 3, 42, 54, 71, 12, 92, 5, 86, 5, 17, 87, 69, 60, 3, 49, 9, 45, 61, 30, 85, 31, 14, 7, 22, 69, 94, 36, 48, 93, 87, 82, 47, 80, 35, 17, 92, 79, 21, 29, 83, 38, 15, 51, 49, 70, 99, 57, 14, 11, 39, 50, 42, 52, 56, 63, 72, 1, 50, 19, 45, 88, 1, 91, 19, 87, 59, 62, 65, 80, 90, 100, 69, 57, 50, 69, 26, 1, 26, 91, 11, 16, 40, 4, 67, 47, 18, 38, 47, 67, 57, 43, 6, 9, 33, 25, 47, 43, 38, 12, 74, 80, 11, 42, 36, 12, 11, 13, 12, 88, 55, 75, 3, 94, 30, 21, 40, 48, 58, 38, 66, 66, 80, 72, 26, 64, 48, 73, 6, 85, 36, 32, 64, 98, 73, 99, 9, 35, 63, 73, 74, 17, 99, 28, 62, 28, 48, 53, 75, 58, 90, 41, 75, 21, 64, 1, 84, 11, 25, 42, 95, 60, 73, 11, 57, 97, 61, 17, 84, 24, 41, 57, 92, 39, 37, 54, 19, 84, 6, 45, 93, 48, 37, 68, 68, 100, 20, 4, 62, 44, 97, 9, 55, 21, 19, 63, 17, 79, 79, 52, 2, 72, 61, 46, 62, 97, 99, 80, 80, 56, 77, 25, 3, 13, 92, 23, 65, 63, 26, 26, 6, 22, 34, 60, 94, 52, 22, 62, 31, 52, 14, 84, 75, 74, 29, 37, 70, 79, 68, 1, 35, 44, 25, 89, 9, 68, 11, 73, 30, 88, 98, 87, 61, 84, 98, 54, 35, 71, 16, 17, 23, 81, 53, 49, 54, 81, 85, 75, 12, 5, 75, 98, 100, 52, 38, 8, 71, 49, 80, 53, 88, 30, 39, 49, 13, 37, 2, 99, 7, 69, 16, 81, 49, 68, 30, 54, 100, 66, 28, 63, 22, 55, 60, 22, 58, 98, 81, 28, 98, 61, 80, 85, 42, 71, 33, 6, 59, 87, 4, 17, 7, 19, 98, 8, 38, 79, 61, 90, 96, 41, 52, 18, 95, 64, 39, 4, 13, 19, 83, 10, 31, 63, 46, 24, 85, 31, 29, 43, 69, 33, 59, 75, 3, 8, 82, 41, 38, 95, 30, 34, 35, 33, 3, 81, 96, 93, 84, 8, 63, 66, 69, 94, 80, 67, 69, 16, 97, 98, 58, 65, 82, 69, 91, 84, 28, 25, 76, 18, 19, 57, 51, 53, 90, 5, 33, 37, 97, 68, 97, 59, 85, 65, 4, 65, 31, 73, 80, 79, 22, 90, 95, 3, 10, 38, 86, 89, 62, 14, 6, 80, 70, 56, 84, 59, 12, 68, 48, 8, 35, 44, 19, 19, 60, 22, 35, 43, 46, 67, 21, 67, 8, 68, 69, 17, 5, 7, 5, 66, 72, 63, 97, 41, 70, 80, 52, 82, 47, 99, 89, 33, 42, 7, 3, 1, 81, 90, 43, 26, 56, 16};
#elif WIDTH == 16
uint16_t data[DATA_MAX] = { 75, 22, 31, 98, 21, 30, 85, 72, 83, 2, 58, 14, 84, 79, 65, 51, 69, 54, 75, 94, 74, 91, 87, 26, 35, 8, 37, 14, 73, 55, 13, 47, 76, 44, 97, 96, 73, 33, 19, 55, 34, 28, 69, 69, 7, 85, 71, 75, 91, 45, 21, 16, 87, 7, 94, 21, 14, 30, 34, 39, 36, 47, 85, 63, 90, 33, 10, 14, 17, 80, 21, 50, 7, 41, 70, 65, 77, 92, 92, 19, 88, 12, 35, 74, 70, 28, 47, 35, 9, 80, 73, 96, 78, 10, 58, 19, 42, 19, 85, 59, 98, 57, 60, 56, 97, 82, 21, 25, 73, 12, 44, 61, 23, 78, 86, 44, 57, 32, 78, 65, 64, 3, 60, 41, 12, 69, 12, 5, 87, 48, 63, 84, 4, 75, 39, 52, 8, 59, 76, 80, 22, 19, 92, 44, 96, 78, 39, 4, 9, 17, 68, 72, 19, 79, 65, 82, 47, 28, 86, 33, 75, 1, 68, 78, 75, 59, 81, 82, 17, 56, 13, 39, 75, 57, 34, 22, 34, 25, 26, 94, 41, 45, 66, 11, 24, 82, 44, 70, 9, 29, 55, 35, 29, 74, 64, 55, 32, 44, 88, 1, 99, 1, 39, 25, 9, 24, 99, 42, 48, 24, 87, 40, 20, 4, 2, 43, 85, 45, 65, 45, 74, 71, 79, 54, 44, 42, 9, 76, 37, 96, 76, 36, 48, 66, 12, 56, 41, 10, 49, 89, 33, 36, 80, 5, 39, 34, 47, 76, 78, 63, 20, 3, 33, 51, 57, 77, 44, 17, 4, 81, 64, 79, 68, 64, 44, 79, 71, 36, 89, 20, 24, 73, 7, 56, 77, 97, 89, 76, 72, 18, 38, 44, 21, 23, 46, 29, 99, 89, 45, 54, 21, 60, 32, 88, 23, 27, 67, 94, 62, 7, 65, 38, 31, 23, 93, 60, 19, 33, 35, 43, 50, 24, 38, 70, 46, 83, 50, 96, 23, 94, 49, 44, 6, 80, 83, 28, 58, 49, 73, 20, 7, 89, 9, 38, 11, 53, 97, 82, 85, 83, 76, 86, 6, 65, 56, 52, 47, 57, 47, 21, 51, 96, 16, 8, 27, 99, 87, 85, 99, 60, 56, 6, 100, 64, 95, 63, 16, 43, 96, 52, 25, 71, 37, 82, 35, 44, 33, 33, 1, 32, 5, 3, 27, 21, 10, 5, 19, 96, 89, 17, 7, 96, 74, 59, 11, 68, 21, 78, 62, 16, 29, 38, 38, 18, 20, 24, 61, 52, 8, 13, 35, 12, 67, 61, 32, 76, 18, 2, 24, 6, 71, 82, 54, 44, 40, 64, 12, 60, 42, 25, 27, 22, 63, 16, 39, 82, 39, 52, 85, 46, 64, 20, 10, 31, 32, 41, 58, 49, 95, 33, 7, 65, 15, 60, 8, 54, 75, 71, 66, 16, 96, 44, 38, 10, 60, 28, 91, 50, 79, 75, 96, 43, 46, 5, 25, 78, 97, 34, 26, 91, 67, 84, 7, 81, 43, 15, 86, 70, 37, 3, 85, 84, 99, 74, 93, 58, 2, 83, 7, 32, 10, 54, 74, 55, 10, 50, 32, 7, 84, 10, 49, 2, 45, 56, 82, 40, 22, 19, 9, 58, 74, 93, 42, 72, 19, 34, 81, 72, 69, 87, 3, 78, 93, 29, 84, 2, 30, 68, 60, 13, 29, 61, 14, 73, 68, 47, 12, 89, 18, 20, 98, 91, 65, 91, 14, 83, 77, 94, 6, 45, 32, 8, 74, 24, 88, 57, 78, 18, 24, 89, 30, 52, 49, 96, 25, 16, 94, 36, 4, 63, 8, 54, 5, 72, 44, 18, 6, 20, 11, 11, 16, 95, 70, 89, 18, 58, 98, 47, 75, 21, 36, 56, 25, 84, 3, 1, 52, 49, 88, 7, 63, 95, 60, 68, 18, 56, 85, 23, 75, 48, 85, 43, 42, 55, 83, 11, 64, 80, 10, 38, 53, 97, 45, 29, 80, 100, 29, 83, 48, 16, 90, 10, 63, 49, 29, 80, 4, 66, 55, 31, 13, 39, 73, 6, 93, 7, 68, 8, 87, 29, 97, 91, 25, 42, 19, 57, 41, 99, 39, 40, 66, 28, 1, 28, 77, 30, 60, 32, 95, 14, 62, 59, 52, 86, 16, 97, 93, 35, 4, 31, 64, 1, 73, 88, 94, 91, 96, 86, 41, 35, 25, 6, 14, 77, 34, 42, 6, 93, 74, 52, 58, 87, 62, 9, 25, 77, 5, 69, 64, 61, 51, 27, 61, 23, 66, 54, 65, 14, 91, 5, 48, 15, 10, 61, 43, 95, 3, 49, 39, 28, 52, 96, 14, 14, 5, 90, 42, 61, 58, 5, 73, 8, 83, 33, 30, 1, 38, 94, 14, 28, 98, 61, 94, 60, 73, 37, 54, 27, 37, 93, 6, 40, 88, 72, 53, 44, 61, 47, 57, 19, 51, 29, 78, 86, 14, 8, 86, 3, 53, 99, 31, 3, 11, 76, 62, 35, 64, 15, 62, 100, 59, 67, 40, 99, 38, 44, 94, 51, 90, 50, 69, 93, 31, 46, 30, 44, 5, 15, 46, 10, 65, 28, 12, 75, 4, 73, 9, 19, 39, 22, 19, 98, 41, 10, 48, 30, 53, 41, 80, 95, 91, 100, 39, 73, 98, 20, 16, 54, 34, 13, 63, 50, 93, 74, 76, 48, 98, 36, 66, 37, 58, 84, 86, 50, 45, 33, 79, 98, 73, 11, 44, 15, 62, 34, 87, 59, 53, 54, 13, 38, 67, 27, 87, 59, 1, 14, 6, 98, 49, 71, 86, 58, 7, 23, 7, 51, 55, 38, 100, 80, 100, 95, 46, 61, 28, 33, 20, 32, 86, 84, 69, 4, 10, 7, 14, 62, 20, 71, 12, 21, 94, 97, 78, 100, 20, 37, 2, 26, 74, 2, 57, 73, 48, 3, 85, 76, 35, 4, 59, 72, 39, 80, 28, 49, 86, 93, 10, 58, 64, 73, 30, 57, 70, 7, 8, 41, 43, 9, 18, 68, 62, 75, 92, 10, 77, 77, 37, 11, 32, 95, 34, 71, 74, 13, 71, 12, 6, 32, 21, 69, 5, 2, 77, 26, 8, 36, 66, 3, 96, 83, 22, 58, 57, 66, 19, 85, 94, 7, 47, 25, 1, 81, 47, 27, 45, 69, 90, 50, 1, 62, 70, 57, 63, 46, 82, 22, 33, 99, 76, 29, 81, 98, 38, 90, 15, 56, 74, 8, 62, 73, 84, 14, 53, 31, 92, 97, 99, 81, 99, 51, 94, 68, 7, 8, 66, 88, 30, 98, 86, 57, 26, 19, 6, 63, 60, 20, 70, 85, 27, 31, 57, 11, 97, 61, 93, 88, 10, 43, 21, 8, 94, 14, 27, 100, 74, 92, 40, 55, 42, 77, 11, 67, 47, 17, 82, 6, 36, 51, 43, 15, 34, 51, 77, 30, 12, 69, 69, 73, 11, 89, 32, 4, 55, 58, 56, 28, 50, 47, 82, 43, 23, 92, 61, 70, 60, 42, 27, 96, 45, 21, 62, 30, 72, 38, 11, 35, 58, 79, 59, 68, 68, 90, 24, 22, 47, 31, 1, 48, 77, 82, 90, 99, 25, 51, 20, 37, 44, 99, 84, 40, 19, 45, 21, 42, 82, 31, 28, 39, 62, 86, 58, 29, 75, 33, 2, 74, 63, 54, 21, 39, 87, 63, 90, 63, 65, 9, 99, 8, 59, 82, 100, 30, 26, 20, 71, 59, 3, 51, 49, 64, 36, 59, 44, 63, 91, 97, 36, 54, 50, 8, 92, 36, 70, 33, 98, 34, 94, 49, 94, 52, 30, 45, 81, 8, 64, 4, 66, 18, 54, 67, 81, 41, 25, 76, 3, 15, 72, 90, 20, 73, 98, 12, 8, 19, 96, 58, 5, 89, 6, 50, 41, 87, 94, 21, 94, 9, 76, 12, 27, 29, 78, 59, 70, 54, 35, 24, 68, 58, 66, 88, 31, 15, 51, 90, 33, 46, 99, 89, 35, 4, 38, 75, 43, 31, 47, 36, 92, 23, 47, 70, 3, 76, 28, 24, 29, 14, 100, 97, 72, 65, 36, 2, 79, 38, 91, 11, 83, 90, 52, 69, 45, 89, 95, 87, 72, 94, 75, 63, 16, 73, 32, 70, 49, 59, 94, 77, 25, 93, 25, 96, 9, 12, 97, 87, 49, 39, 49, 84, 80, 100, 4, 25, 89, 99, 63, 12, 92, 89, 74, 59, 62, 57, 80, 10, 67, 73, 38, 91, 17, 63, 86, 25, 26, 34, 63, 75, 73, 64, 10, 52, 63, 13, 28, 3, 63, 43, 14, 54, 31, 39, 64, 92, 95, 44, 53, 62, 68, 91, 52, 37, 5, 90, 13, 30, 23, 28, 56, 47, 91, 65, 51, 53, 78, 78, 8, 40, 72, 21, 46, 55, 12, 61, 98, 6, 56, 51, 19, 76, 93, 71, 12, 97, 12, 76, 78, 34, 3, 34, 81, 93, 98, 31, 98, 27, 60, 5, 19, 84, 77, 16, 38, 40, 76, 35, 46, 32, 37, 64, 7, 29, 86, 70, 77, 97, 45, 55, 83, 100, 88, 15, 92, 37, 97, 41, 64, 8, 97, 34, 91, 74, 49, 80, 65, 24, 67, 10, 7, 3, 26, 13, 84, 63, 34, 60, 12, 31, 14, 94, 30, 1, 8, 73, 90, 56, 14, 53, 63, 10, 38, 54, 35, 86, 85, 52, 9, 51, 61, 16, 54, 38, 80, 37, 1, 66, 96, 12, 96, 62, 57, 25, 14, 16, 49, 3, 71, 14, 7, 33, 76, 44, 38, 62, 29, 23, 13, 90, 73, 74, 57, 78, 63, 88, 66, 63, 53, 14, 26, 48, 75, 34, 24, 40, 49, 73, 43, 71, 38, 1, 4, 13, 45, 93, 75, 25, 67, 87, 14, 92, 12, 22, 69, 75, 10, 87, 89, 62, 100, 67, 10, 26, 100, 85, 65, 1, 9, 59, 71, 47, 60, 26, 59, 4, 19, 85, 80, 85, 24, 94, 28, 35, 15, 49, 61, 76, 35, 2, 38, 86, 68, 99, 11, 67, 83, 75, 19, 44, 34, 90, 90, 93, 15, 100, 48, 33, 37, 27, 70, 60, 72, 49, 94, 39, 97, 7, 14, 31, 8, 3, 16, 75, 1, 78, 93, 36, 53, 12, 79, 38, 53, 20, 82, 67, 71, 81, 52, 7, 59, 73, 18, 31, 21, 64, 21, 18, 70, 86, 100, 77, 89, 16, 3, 89, 93, 47, 24, 97, 10, 54, 86, 62, 73, 67, 29, 96, 99, 32, 2, 58, 4, 72, 88, 24, 35, 60, 93, 4, 45, 93, 32, 33, 8, 34, 22, 52, 32, 97, 1, 42, 51, 86, 3, 75, 5, 83, 70, 3, 14, 24, 12, 17, 95, 51, 93, 29, 10, 85, 84, 55, 77, 15, 39, 36, 48, 12, 88, 31, 9, 40, 72, 11, 25, 75, 85, 81, 57, 7, 36, 23, 30, 47, 39, 76, 98, 31, 4, 59, 68, 87, 13, 44, 53, 4, 80, 52, 15, 19, 82, 23, 58, 54, 85, 34, 28, 70, 15, 36, 28, 2, 58, 9, 48, 49, 84, 97, 31, 39, 56, 98, 77, 20, 42, 29, 23, 73, 80, 38, 43, 61, 12, 52, 14, 97, 85, 93, 18, 51, 81, 45, 52, 90, 5, 52, 38, 88, 100, 69, 26, 55, 18, 54, 27, 59, 82, 49, 83, 13, 38, 77, 73, 2, 28, 39, 98, 13, 83, 67, 15, 15, 63, 19, 5, 67, 22, 94, 54, 21, 14, 31, 28, 32, 36, 54, 42, 17, 54, 77, 81, 44, 53, 5, 45, 81, 43, 94, 45, 78, 60, 59, 44, 22, 29, 100, 88, 50, 94, 93, 23, 7, 75, 2, 90, 10, 7, 32, 78, 60, 8, 58, 55, 60, 62, 99, 92, 57, 92, 36, 86, 3, 47, 29, 24, 27, 29, 63, 29, 74, 7, 51, 32, 81, 52, 22, 42, 58, 5, 71, 69, 64, 28, 76, 23, 42, 74, 67, 98, 18, 2, 35, 72, 100, 63, 96, 27, 43, 10, 55, 68, 69, 57, 100, 1, 60, 73, 43, 69, 77, 13, 37, 40, 93, 12, 14, 34, 38, 80, 83, 7, 34, 17, 78, 33, 31, 25, 11, 74, 87, 65, 93, 55, 21, 92, 55, 80, 64, 49, 48, 92, 14, 37, 31, 6, 100, 97, 91, 89, 28, 73, 95, 13, 41, 25, 46, 71, 49, 8, 96, 87, 73, 89, 41, 45, 32, 96, 77, 96, 96, 76, 39, 9, 64};
uint16_t coeffs[COEFF_MAX] = {   1, 86, 77, 17, 99, 35, 72, 63, 45, 99, 98, 26, 32, 78, 64, 73, 24, 59, 6, 97, 29, 40, 26, 96, 29, 4, 43, 54, 48, 99, 69, 48, 36, 45, 17, 34, 80, 88, 96, 76, 87, 45, 2, 70, 22, 17, 43, 98, 75, 100, 94, 56, 39, 71, 51, 19, 74, 93, 24, 73, 44, 92, 20, 79, 89, 36, 65, 20, 76, 60, 47, 14, 57, 100, 35, 78, 17, 29, 27, 43, 28, 20, 98, 18, 42, 1, 36, 67, 93, 12, 39, 88, 55, 11, 19, 43, 98, 83, 14, 25, 94, 61, 38, 50, 60, 25, 80, 76, 53, 6, 19, 33, 78, 68, 50, 19, 68, 38, 86, 13, 49, 76, 100, 3, 86, 18, 98, 84, 52, 11, 8, 46, 71, 98, 47, 31, 22, 26, 58, 26, 32, 28, 58, 61, 96, 60, 79, 63, 49, 16, 75, 97, 92, 27, 51, 29, 96, 100, 12, 48, 11, 72, 93, 33, 69, 39, 15, 42, 17, 73, 19, 48, 52, 77, 60, 47, 88, 90, 62, 36, 6, 88, 84, 49, 14, 86, 77, 10, 86, 41, 57, 96, 12, 1, 28, 32, 39, 43, 73, 7, 67, 43, 6, 18, 71, 65, 17, 58, 55, 78, 45, 60, 65, 28, 60, 31, 14, 88, 40, 99, 28, 48, 46, 91, 48, 73, 22, 38, 67, 46, 45, 33, 89, 50, 3, 59, 15, 19, 69, 21, 48, 13, 32, 12, 41, 91, 94, 6, 78, 33, 56, 58, 32, 1, 48, 79, 25, 22, 69, 92, 19, 65, 76, 59, 14, 78, 18, 80, 48, 38, 52, 95, 50, 83, 59, 42, 73, 52, 47, 3, 85, 54, 12, 68, 54, 11, 99, 79, 32, 67, 22, 3, 31, 49, 61, 96, 27, 30, 28, 26, 67, 79, 21, 69, 62, 79, 10, 86, 30, 9, 40, 66, 62, 51, 34, 16, 62, 84, 46, 45, 50, 67, 47, 32, 15, 60, 79, 93, 89, 58, 19, 8, 89, 91, 76, 2, 69, 85, 87, 50, 93, 27, 16, 7, 77, 1, 74, 90, 84, 19, 35, 85, 37, 81, 68, 3, 40, 46, 48, 81, 56, 66, 88, 44, 8, 63, 45, 76, 99, 83, 25, 44, 9, 92, 50, 38, 92, 23, 27, 27, 93, 13, 11, 29, 94, 78, 83, 85, 76, 30, 17, 83, 47, 4, 26, 54, 18, 22, 29, 17, 4, 6, 12, 65, 49, 13, 2, 93, 87, 80, 19, 79, 93, 82, 7, 38, 11, 89, 74, 38, 71, 91, 20, 17, 46, 97, 71, 64, 18, 51, 32, 22, 8, 95, 38, 57, 7, 39, 49, 93, 70, 19, 71, 14, 52, 29, 51, 63, 69, 77, 52, 39, 67, 72, 56, 12, 20, 78, 27, 38, 28, 10, 11, 36, 4, 48, 44, 62, 38, 44, 54, 7, 14, 76, 73, 66, 56, 23, 80, 77, 99, 31, 15, 17, 54, 22, 81, 74, 51, 59, 11, 79, 69, 73, 66, 24, 20, 61, 86, 9, 4, 91, 67, 17, 19, 39, 82, 74, 14, 13, 50, 12, 44, 17, 81, 97, 90, 61, 22, 41, 71, 32, 71, 39, 56, 88, 15, 27, 48, 52, 35, 3, 42, 54, 71, 12, 92, 5, 86, 5, 17, 87, 69, 60, 3, 49, 9, 45, 61, 30, 85, 31, 14, 7, 22, 69, 94, 36, 48, 93, 87, 82, 47, 80, 35, 17, 92, 79, 21, 29, 83, 38, 15, 51, 49, 70, 99, 57, 14, 11, 39, 50, 42, 52, 56, 63, 72, 1, 50, 19, 45, 88, 1, 91, 19, 87, 59, 62, 65, 80, 90, 100, 69, 57, 50, 69, 26, 1, 26, 91, 11, 16, 40, 4, 67, 47, 18, 38, 47, 67, 57, 43, 6, 9, 33, 25, 47, 43, 38, 12, 74, 80, 11, 42, 36, 12, 11, 13, 12, 88, 55, 75, 3, 94, 30, 21, 40, 48, 58, 38, 66, 66, 80, 72, 26, 64, 48, 73, 6, 85, 36, 32, 64, 98, 73, 99, 9, 35, 63, 73, 74, 17, 99, 28, 62, 28, 48, 53, 75, 58, 90, 41, 75, 21, 64, 1, 84, 11, 25, 42, 95, 60, 73, 11, 57, 97, 61, 17, 84, 24, 41, 57, 92, 39, 37, 54, 19, 84, 6, 45, 93, 48, 37, 68, 68, 100, 20, 4, 62, 44, 97, 9, 55, 21, 19, 63, 17, 79, 79, 52, 2, 72, 61, 46, 62, 97, 99, 80, 80, 56, 77, 25, 3, 13, 92, 23, 65, 63, 26, 26, 6, 22, 34, 60, 94, 52, 22, 62, 31, 52, 14, 84, 75, 74, 29, 37, 70, 79, 68, 1, 35, 44, 25, 89, 9, 68, 11, 73, 30, 88, 98, 87, 61, 84, 98, 54, 35, 71, 16, 17, 23, 81, 53, 49, 54, 81, 85, 75, 12, 5, 75, 98, 100, 52, 38, 8, 71, 49, 80, 53, 88, 30, 39, 49, 13, 37, 2, 99, 7, 69, 16, 81, 49, 68, 30, 54, 100, 66, 28, 63, 22, 55, 60, 22, 58, 98, 81, 28, 98, 61, 80, 85, 42, 71, 33, 6, 59, 87, 4, 17, 7, 19, 98, 8, 38, 79, 61, 90, 96, 41, 52, 18, 95, 64, 39, 4, 13, 19, 83, 10, 31, 63, 46, 24, 85, 31, 29, 43, 69, 33, 59, 75, 3, 8, 82, 41, 38, 95, 30, 34, 35, 33, 3, 81, 96, 93, 84, 8, 63, 66, 69, 94, 80, 67, 69, 16, 97, 98, 58, 65, 82, 69, 91, 84, 28, 25, 76, 18, 19, 57, 51, 53, 90, 5, 33, 37, 97, 68, 97, 59, 85, 65, 4, 65, 31, 73, 80, 79, 22, 90, 95, 3, 10, 38, 86, 89, 62, 14, 6, 80, 70, 56, 84, 59, 12, 68, 48, 8, 35, 44, 19, 19, 60, 22, 35, 43, 46, 67, 21, 67, 8, 68, 69, 17, 5, 7, 5, 66, 72, 63, 97, 41, 70, 80, 52, 82, 47, 99, 89, 33, 42, 7, 3, 1, 81, 90, 43, 26, 56, 16};
#elif WIDTH == 8
uint8_t data[DATA_MAX] = { 75, 22, 31, 98, 21, 30, 85, 72, 83, 2, 58, 14, 84, 79, 65, 51, 69, 54, 75, 94, 74, 91, 87, 26, 35, 8, 37, 14, 73, 55, 13, 47, 76, 44, 97, 96, 73, 33, 19, 55, 34, 28, 69, 69, 7, 85, 71, 75, 91, 45, 21, 16, 87, 7, 94, 21, 14, 30, 34, 39, 36, 47, 85, 63, 90, 33, 10, 14, 17, 80, 21, 50, 7, 41, 70, 65, 77, 92, 92, 19, 88, 12, 35, 74, 70, 28, 47, 35, 9, 80, 73, 96, 78, 10, 58, 19, 42, 19, 85, 59, 98, 57, 60, 56, 97, 82, 21, 25, 73, 12, 44, 61, 23, 78, 86, 44, 57, 32, 78, 65, 64, 3, 60, 41, 12, 69, 12, 5, 87, 48, 63, 84, 4, 75, 39, 52, 8, 59, 76, 80, 22, 19, 92, 44, 96, 78, 39, 4, 9, 17, 68, 72, 19, 79, 65, 82, 47, 28, 86, 33, 75, 1, 68, 78, 75, 59, 81, 82, 17, 56, 13, 39, 75, 57, 34, 22, 34, 25, 26, 94, 41, 45, 66, 11, 24, 82, 44, 70, 9, 29, 55, 35, 29, 74, 64, 55, 32, 44, 88, 1, 99, 1, 39, 25, 9, 24, 99, 42, 48, 24, 87, 40, 20, 4, 2, 43, 85, 45, 65, 45, 74, 71, 79, 54, 44, 42, 9, 76, 37, 96, 76, 36, 48, 66, 12, 56, 41, 10, 49, 89, 33, 36, 80, 5, 39, 34, 47, 76, 78, 63, 20, 3, 33, 51, 57, 77, 44, 17, 4, 81, 64, 79, 68, 64, 44, 79, 71, 36, 89, 20, 24, 73, 7, 56, 77, 97, 89, 76, 72, 18, 38, 44, 21, 23, 46, 29, 99, 89, 45, 54, 21, 60, 32, 88, 23, 27, 67, 94, 62, 7, 65, 38, 31, 23, 93, 60, 19, 33, 35, 43, 50, 24, 38, 70, 46, 83, 50, 96, 23, 94, 49, 44, 6, 80, 83, 28, 58, 49, 73, 20, 7, 89, 9, 38, 11, 53, 97, 82, 85, 83, 76, 86, 6, 65, 56, 52, 47, 57, 47, 21, 51, 96, 16, 8, 27, 99, 87, 85, 99, 60, 56, 6, 100, 64, 95, 63, 16, 43, 96, 52, 25, 71, 37, 82, 35, 44, 33, 33, 1, 32, 5, 3, 27, 21, 10, 5, 19, 96, 89, 17, 7, 96, 74, 59, 11, 68, 21, 78, 62, 16, 29, 38, 38, 18, 20, 24, 61, 52, 8, 13, 35, 12, 67, 61, 32, 76, 18, 2, 24, 6, 71, 82, 54, 44, 40, 64, 12, 60, 42, 25, 27, 22, 63, 16, 39, 82, 39, 52, 85, 46, 64, 20, 10, 31, 32, 41, 58, 49, 95, 33, 7, 65, 15, 60, 8, 54, 75, 71, 66, 16, 96, 44, 38, 10, 60, 28, 91, 50, 79, 75, 96, 43, 46, 5, 25, 78, 97, 34, 26, 91, 67, 84, 7, 81, 43, 15, 86, 70, 37, 3, 85, 84, 99, 74, 93, 58, 2, 83, 7, 32, 10, 54, 74, 55, 10, 50, 32, 7, 84, 10, 49, 2, 45, 56, 82, 40, 22, 19, 9, 58, 74, 93, 42, 72, 19, 34, 81, 72, 69, 87, 3, 78, 93, 29, 84, 2, 30, 68, 60, 13, 29, 61, 14, 73, 68, 47, 12, 89, 18, 20, 98, 91, 65, 91, 14, 83, 77, 94, 6, 45, 32, 8, 74, 24, 88, 57, 78, 18, 24, 89, 30, 52, 49, 96, 25, 16, 94, 36, 4, 63, 8, 54, 5, 72, 44, 18, 6, 20, 11, 11, 16, 95, 70, 89, 18, 58, 98, 47, 75, 21, 36, 56, 25, 84, 3, 1, 52, 49, 88, 7, 63, 95, 60, 68, 18, 56, 85, 23, 75, 48, 85, 43, 42, 55, 83, 11, 64, 80, 10, 38, 53, 97, 45, 29, 80, 100, 29, 83, 48, 16, 90, 10, 63, 49, 29, 80, 4, 66, 55, 31, 13, 39, 73, 6, 93, 7, 68, 8, 87, 29, 97, 91, 25, 42, 19, 57, 41, 99, 39, 40, 66, 28, 1, 28, 77, 30, 60, 32, 95, 14, 62, 59, 52, 86, 16, 97, 93, 35, 4, 31, 64, 1, 73, 88, 94, 91, 96, 86, 41, 35, 25, 6, 14, 77, 34, 42, 6, 93, 74, 52, 58, 87, 62, 9, 25, 77, 5, 69, 64, 61, 51, 27, 61, 23, 66, 54, 65, 14, 91, 5, 48, 15, 10, 61, 43, 95, 3, 49, 39, 28, 52, 96, 14, 14, 5, 90, 42, 61, 58, 5, 73, 8, 83, 33, 30, 1, 38, 94, 14, 28, 98, 61, 94, 60, 73, 37, 54, 27, 37, 93, 6, 40, 88, 72, 53, 44, 61, 47, 57, 19, 51, 29, 78, 86, 14, 8, 86, 3, 53, 99, 31, 3, 11, 76, 62, 35, 64, 15, 62, 100, 59, 67, 40, 99, 38, 44, 94, 51, 90, 50, 69, 93, 31, 46, 30, 44, 5, 15, 46, 10, 65, 28, 12, 75, 4, 73, 9, 19, 39, 22, 19, 98, 41, 10, 48, 30, 53, 41, 80, 95, 91, 100, 39, 73, 98, 20, 16, 54, 34, 13, 63, 50, 93, 74, 76, 48, 98, 36, 66, 37, 58, 84, 86, 50, 45, 33, 79, 98, 73, 11, 44, 15, 62, 34, 87, 59, 53, 54, 13, 38, 67, 27, 87, 59, 1, 14, 6, 98, 49, 71, 86, 58, 7, 23, 7, 51, 55, 38, 100, 80, 100, 95, 46, 61, 28, 33, 20, 32, 86, 84, 69, 4, 10, 7, 14, 62, 20, 71, 12, 21, 94, 97, 78, 100, 20, 37, 2, 26, 74, 2, 57, 73, 48, 3, 85, 76, 35, 4, 59, 72, 39, 80, 28, 49, 86, 93, 10, 58, 64, 73, 30, 57, 70, 7, 8, 41, 43, 9, 18, 68, 62, 75, 92, 10, 77, 77, 37, 11, 32, 95, 34, 71, 74, 13, 71, 12, 6, 32, 21, 69, 5, 2, 77, 26, 8, 36, 66, 3, 96, 83, 22, 58, 57, 66, 19, 85, 94, 7, 47, 25, 1, 81, 47, 27, 45, 69, 90, 50, 1, 62, 70, 57, 63, 46, 82, 22, 33, 99, 76, 29, 81, 98, 38, 90, 15, 56, 74, 8, 62, 73, 84, 14, 53, 31, 92, 97, 99, 81, 99, 51, 94, 68, 7, 8, 66, 88, 30, 98, 86, 57, 26, 19, 6, 63, 60, 20, 70, 85, 27, 31, 57, 11, 97, 61, 93, 88, 10, 43, 21, 8, 94, 14, 27, 100, 74, 92, 40, 55, 42, 77, 11, 67, 47, 17, 82, 6, 36, 51, 43, 15, 34, 51, 77, 30, 12, 69, 69, 73, 11, 89, 32, 4, 55, 58, 56, 28, 50, 47, 82, 43, 23, 92, 61, 70, 60, 42, 27, 96, 45, 21, 62, 30, 72, 38, 11, 35, 58, 79, 59, 68, 68, 90, 24, 22, 47, 31, 1, 48, 77, 82, 90, 99, 25, 51, 20, 37, 44, 99, 84, 40, 19, 45, 21, 42, 82, 31, 28, 39, 62, 86, 58, 29, 75, 33, 2, 74, 63, 54, 21, 39, 87, 63, 90, 63, 65, 9, 99, 8, 59, 82, 100, 30, 26, 20, 71, 59, 3, 51, 49, 64, 36, 59, 44, 63, 91, 97, 36, 54, 50, 8, 92, 36, 70, 33, 98, 34, 94, 49, 94, 52, 30, 45, 81, 8, 64, 4, 66, 18, 54, 67, 81, 41, 25, 76, 3, 15, 72, 90, 20, 73, 98, 12, 8, 19, 96, 58, 5, 89, 6, 50, 41, 87, 94, 21, 94, 9, 76, 12, 27, 29, 78, 59, 70, 54, 35, 24, 68, 58, 66, 88, 31, 15, 51, 90, 33, 46, 99, 89, 35, 4, 38, 75, 43, 31, 47, 36, 92, 23, 47, 70, 3, 76, 28, 24, 29, 14, 100, 97, 72, 65, 36, 2, 79, 38, 91, 11, 83, 90, 52, 69, 45, 89, 95, 87, 72, 94, 75, 63, 16, 73, 32, 70, 49, 59, 94, 77, 25, 93, 25, 96, 9, 12, 97, 87, 49, 39, 49, 84, 80, 100, 4, 25, 89, 99, 63, 12, 92, 89, 74, 59, 62, 57, 80, 10, 67, 73, 38, 91, 17, 63, 86, 25, 26, 34, 63, 75, 73, 64, 10, 52, 63, 13, 28, 3, 63, 43, 14, 54, 31, 39, 64, 92, 95, 44, 53, 62, 68, 91, 52, 37, 5, 90, 13, 30, 23, 28, 56, 47, 91, 65, 51, 53, 78, 78, 8, 40, 72, 21, 46, 55, 12, 61, 98, 6, 56, 51, 19, 76, 93, 71, 12, 97, 12, 76, 78, 34, 3, 34, 81, 93, 98, 31, 98, 27, 60, 5, 19, 84, 77, 16, 38, 40, 76, 35, 46, 32, 37, 64, 7, 29, 86, 70, 77, 97, 45, 55, 83, 100, 88, 15, 92, 37, 97, 41, 64, 8, 97, 34, 91, 74, 49, 80, 65, 24, 67, 10, 7, 3, 26, 13, 84, 63, 34, 60, 12, 31, 14, 94, 30, 1, 8, 73, 90, 56, 14, 53, 63, 10, 38, 54, 35, 86, 85, 52, 9, 51, 61, 16, 54, 38, 80, 37, 1, 66, 96, 12, 96, 62, 57, 25, 14, 16, 49, 3, 71, 14, 7, 33, 76, 44, 38, 62, 29, 23, 13, 90, 73, 74, 57, 78, 63, 88, 66, 63, 53, 14, 26, 48, 75, 34, 24, 40, 49, 73, 43, 71, 38, 1, 4, 13, 45, 93, 75, 25, 67, 87, 14, 92, 12, 22, 69, 75, 10, 87, 89, 62, 100, 67, 10, 26, 100, 85, 65, 1, 9, 59, 71, 47, 60, 26, 59, 4, 19, 85, 80, 85, 24, 94, 28, 35, 15, 49, 61, 76, 35, 2, 38, 86, 68, 99, 11, 67, 83, 75, 19, 44, 34, 90, 90, 93, 15, 100, 48, 33, 37, 27, 70, 60, 72, 49, 94, 39, 97, 7, 14, 31, 8, 3, 16, 75, 1, 78, 93, 36, 53, 12, 79, 38, 53, 20, 82, 67, 71, 81, 52, 7, 59, 73, 18, 31, 21, 64, 21, 18, 70, 86, 100, 77, 89, 16, 3, 89, 93, 47, 24, 97, 10, 54, 86, 62, 73, 67, 29, 96, 99, 32, 2, 58, 4, 72, 88, 24, 35, 60, 93, 4, 45, 93, 32, 33, 8, 34, 22, 52, 32, 97, 1, 42, 51, 86, 3, 75, 5, 83, 70, 3, 14, 24, 12, 17, 95, 51, 93, 29, 10, 85, 84, 55, 77, 15, 39, 36, 48, 12, 88, 31, 9, 40, 72, 11, 25, 75, 85, 81, 57, 7, 36, 23, 30, 47, 39, 76, 98, 31, 4, 59, 68, 87, 13, 44, 53, 4, 80, 52, 15, 19, 82, 23, 58, 54, 85, 34, 28, 70, 15, 36, 28, 2, 58, 9, 48, 49, 84, 97, 31, 39, 56, 98, 77, 20, 42, 29, 23, 73, 80, 38, 43, 61, 12, 52, 14, 97, 85, 93, 18, 51, 81, 45, 52, 90, 5, 52, 38, 88, 100, 69, 26, 55, 18, 54, 27, 59, 82, 49, 83, 13, 38, 77, 73, 2, 28, 39, 98, 13, 83, 67, 15, 15, 63, 19, 5, 67, 22, 94, 54, 21, 14, 31, 28, 32, 36, 54, 42, 17, 54, 77, 81, 44, 53, 5, 45, 81, 43, 94, 45, 78, 60, 59, 44, 22, 29, 100, 88, 50, 94, 93, 23, 7, 75, 2, 90, 10, 7, 32, 78, 60, 8, 58, 55, 60, 62, 99, 92, 57, 92, 36, 86, 3, 47, 29, 24, 27, 29, 63, 29, 74, 7, 51, 32, 81, 52, 22, 42, 58, 5, 71, 69, 64, 28, 76, 23, 42, 74, 67, 98, 18, 2, 35, 72, 100, 63, 96, 27, 43, 10, 55, 68, 69, 57, 100, 1, 60, 73, 43, 69, 77, 13, 37, 40, 93, 12, 14, 34, 38, 80, 83, 7, 34, 17, 78, 33, 31, 25, 11, 74, 87, 65, 93, 55, 21, 92, 55, 80, 64, 49, 48, 92, 14, 37, 31, 6, 100, 97, 91, 89, 28, 73, 95, 13, 41, 25, 46, 71, 49, 8, 96, 87, 73, 89, 41, 45, 32, 96, 77, 96, 96, 76, 39, 9, 64};
uint8_t coeffs[COEFF_MAX] = {   1, 86, 77, 17, 99, 35, 72, 63, 45, 99, 98, 26, 32, 78, 64, 73, 24, 59, 6, 97, 29, 40, 26, 96, 29, 4, 43, 54, 48, 99, 69, 48, 36, 45, 17, 34, 80, 88, 96, 76, 87, 45, 2, 70, 22, 17, 43, 98, 75, 100, 94, 56, 39, 71, 51, 19, 74, 93, 24, 73, 44, 92, 20, 79, 89, 36, 65, 20, 76, 60, 47, 14, 57, 100, 35, 78, 17, 29, 27, 43, 28, 20, 98, 18, 42, 1, 36, 67, 93, 12, 39, 88, 55, 11, 19, 43, 98, 83, 14, 25, 94, 61, 38, 50, 60, 25, 80, 76, 53, 6, 19, 33, 78, 68, 50, 19, 68, 38, 86, 13, 49, 76, 100, 3, 86, 18, 98, 84, 52, 11, 8, 46, 71, 98, 47, 31, 22, 26, 58, 26, 32, 28, 58, 61, 96, 60, 79, 63, 49, 16, 75, 97, 92, 27, 51, 29, 96, 100, 12, 48, 11, 72, 93, 33, 69, 39, 15, 42, 17, 73, 19, 48, 52, 77, 60, 47, 88, 90, 62, 36, 6, 88, 84, 49, 14, 86, 77, 10, 86, 41, 57, 96, 12, 1, 28, 32, 39, 43, 73, 7, 67, 43, 6, 18, 71, 65, 17, 58, 55, 78, 45, 60, 65, 28, 60, 31, 14, 88, 40, 99, 28, 48, 46, 91, 48, 73, 22, 38, 67, 46, 45, 33, 89, 50, 3, 59, 15, 19, 69, 21, 48, 13, 32, 12, 41, 91, 94, 6, 78, 33, 56, 58, 32, 1, 48, 79, 25, 22, 69, 92, 19, 65, 76, 59, 14, 78, 18, 80, 48, 38, 52, 95, 50, 83, 59, 42, 73, 52, 47, 3, 85, 54, 12, 68, 54, 11, 99, 79, 32, 67, 22, 3, 31, 49, 61, 96, 27, 30, 28, 26, 67, 79, 21, 69, 62, 79, 10, 86, 30, 9, 40, 66, 62, 51, 34, 16, 62, 84, 46, 45, 50, 67, 47, 32, 15, 60, 79, 93, 89, 58, 19, 8, 89, 91, 76, 2, 69, 85, 87, 50, 93, 27, 16, 7, 77, 1, 74, 90, 84, 19, 35, 85, 37, 81, 68, 3, 40, 46, 48, 81, 56, 66, 88, 44, 8, 63, 45, 76, 99, 83, 25, 44, 9, 92, 50, 38, 92, 23, 27, 27, 93, 13, 11, 29, 94, 78, 83, 85, 76, 30, 17, 83, 47, 4, 26, 54, 18, 22, 29, 17, 4, 6, 12, 65, 49, 13, 2, 93, 87, 80, 19, 79, 93, 82, 7, 38, 11, 89, 74, 38, 71, 91, 20, 17, 46, 97, 71, 64, 18, 51, 32, 22, 8, 95, 38, 57, 7, 39, 49, 93, 70, 19, 71, 14, 52, 29, 51, 63, 69, 77, 52, 39, 67, 72, 56, 12, 20, 78, 27, 38, 28, 10, 11, 36, 4, 48, 44, 62, 38, 44, 54, 7, 14, 76, 73, 66, 56, 23, 80, 77, 99, 31, 15, 17, 54, 22, 81, 74, 51, 59, 11, 79, 69, 73, 66, 24, 20, 61, 86, 9, 4, 91, 67, 17, 19, 39, 82, 74, 14, 13, 50, 12, 44, 17, 81, 97, 90, 61, 22, 41, 71, 32, 71, 39, 56, 88, 15, 27, 48, 52, 35, 3, 42, 54, 71, 12, 92, 5, 86, 5, 17, 87, 69, 60, 3, 49, 9, 45, 61, 30, 85, 31, 14, 7, 22, 69, 94, 36, 48, 93, 87, 82, 47, 80, 35, 17, 92, 79, 21, 29, 83, 38, 15, 51, 49, 70, 99, 57, 14, 11, 39, 50, 42, 52, 56, 63, 72, 1, 50, 19, 45, 88, 1, 91, 19, 87, 59, 62, 65, 80, 90, 100, 69, 57, 50, 69, 26, 1, 26, 91, 11, 16, 40, 4, 67, 47, 18, 38, 47, 67, 57, 43, 6, 9, 33, 25, 47, 43, 38, 12, 74, 80, 11, 42, 36, 12, 11, 13, 12, 88, 55, 75, 3, 94, 30, 21, 40, 48, 58, 38, 66, 66, 80, 72, 26, 64, 48, 73, 6, 85, 36, 32, 64, 98, 73, 99, 9, 35, 63, 73, 74, 17, 99, 28, 62, 28, 48, 53, 75, 58, 90, 41, 75, 21, 64, 1, 84, 11, 25, 42, 95, 60, 73, 11, 57, 97, 61, 17, 84, 24, 41, 57, 92, 39, 37, 54, 19, 84, 6, 45, 93, 48, 37, 68, 68, 100, 20, 4, 62, 44, 97, 9, 55, 21, 19, 63, 17, 79, 79, 52, 2, 72, 61, 46, 62, 97, 99, 80, 80, 56, 77, 25, 3, 13, 92, 23, 65, 63, 26, 26, 6, 22, 34, 60, 94, 52, 22, 62, 31, 52, 14, 84, 75, 74, 29, 37, 70, 79, 68, 1, 35, 44, 25, 89, 9, 68, 11, 73, 30, 88, 98, 87, 61, 84, 98, 54, 35, 71, 16, 17, 23, 81, 53, 49, 54, 81, 85, 75, 12, 5, 75, 98, 100, 52, 38, 8, 71, 49, 80, 53, 88, 30, 39, 49, 13, 37, 2, 99, 7, 69, 16, 81, 49, 68, 30, 54, 100, 66, 28, 63, 22, 55, 60, 22, 58, 98, 81, 28, 98, 61, 80, 85, 42, 71, 33, 6, 59, 87, 4, 17, 7, 19, 98, 8, 38, 79, 61, 90, 96, 41, 52, 18, 95, 64, 39, 4, 13, 19, 83, 10, 31, 63, 46, 24, 85, 31, 29, 43, 69, 33, 59, 75, 3, 8, 82, 41, 38, 95, 30, 34, 35, 33, 3, 81, 96, 93, 84, 8, 63, 66, 69, 94, 80, 67, 69, 16, 97, 98, 58, 65, 82, 69, 91, 84, 28, 25, 76, 18, 19, 57, 51, 53, 90, 5, 33, 37, 97, 68, 97, 59, 85, 65, 4, 65, 31, 73, 80, 79, 22, 90, 95, 3, 10, 38, 86, 89, 62, 14, 6, 80, 70, 56, 84, 59, 12, 68, 48, 8, 35, 44, 19, 19, 60, 22, 35, 43, 46, 67, 21, 67, 8, 68, 69, 17, 5, 7, 5, 66, 72, 63, 97, 41, 70, 80, 52, 82, 47, 99, 89, 33, 42, 7, 3, 1, 81, 90, 43, 26, 56, 16};
#endif
