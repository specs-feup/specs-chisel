#define DATA_MAX 2000
#define COEFF_MAX 1000
uint32_t data[DATA_MAX] = { 76, 73, 51, 46, 64, 68, 38, 2, 25, 14, 10, 79, 22, 58, 67, 40, 47, 35, 77, 100, 55, 64, 79, 61, 17, 63, 29, 59, 44, 17, 63, 19, 41, 65, 16, 4, 84, 54, 6, 9, 19, 67, 39, 40, 76, 5, 31, 22, 91, 7, 21, 97, 70, 51, 10, 38, 13, 38, 96, 8, 54, 10, 78, 47, 75, 93, 50, 58, 46, 7, 18, 16, 25, 8, 7, 100, 65, 37, 21, 55, 43, 93, 52, 65, 43, 61, 2, 7, 50, 50, 14, 56, 59, 91, 2, 33, 84, 3, 43, 81, 10, 12, 97, 34, 20, 55, 86, 84, 92, 58, 90, 34, 51, 93, 98, 45, 5, 52, 52, 55, 1, 17, 10, 59, 8, 11, 44, 43, 13, 38, 75, 74, 1, 23, 60, 72, 78, 45, 55, 69, 54, 97, 54, 4, 89, 4, 1, 94, 55, 4, 48, 7, 20, 9, 65, 79, 19, 60, 73, 83, 49, 48, 9, 50, 70, 68, 21, 99, 64, 28, 67, 17, 24, 73, 73, 64, 76, 25, 57, 82, 28, 56, 88, 99, 64, 4, 30, 34, 16, 54, 17, 64, 1, 77, 13, 23, 44, 86, 21, 59, 13, 40, 75, 88, 64, 99, 51, 91, 23, 8, 72, 2, 15, 11, 53, 79, 66, 82, 12, 81, 35, 80, 97, 88, 56, 61, 62, 51, 46, 34, 9, 58, 25, 36, 45, 88, 34, 48, 78, 57, 55, 1, 10, 69, 63, 62, 99, 29, 95, 11, 61, 82, 42, 57, 21, 98, 18, 82, 100, 15, 15, 9, 73, 40, 44, 69, 79, 29, 16, 57, 37, 22, 9, 47, 43, 72, 60, 41, 52, 55, 3, 12, 36, 45, 21, 56, 94, 90, 89, 93, 4, 55, 53, 28, 46, 48, 49, 25, 77, 16, 33, 13, 38, 41, 11, 32, 12, 71, 72, 63, 25, 27, 27, 12, 71, 99, 19, 16, 40, 59, 60, 95, 13, 13, 23, 59, 60, 23, 83, 88, 38, 67, 1, 27, 7, 63, 58, 19, 33, 82, 33, 9, 8, 11, 72, 30, 9, 42, 97, 48, 100, 56, 43, 13, 68, 17, 23, 80, 91, 57, 67, 28, 23, 19, 7, 29, 34, 16, 99, 66, 49, 84, 27, 56, 94, 98, 37, 55, 40, 33, 54, 91, 41, 48, 55, 8, 16, 77, 39, 6, 85, 58, 86, 7, 76, 92, 88, 61, 59, 86, 27, 8, 21, 5, 15, 15, 54, 52, 21, 45, 36, 74, 36, 76, 22, 90, 36, 37, 67, 74, 43, 51, 83, 80, 10, 11, 71, 97, 71, 29, 34, 97, 88, 55, 53, 3, 21, 7, 6, 41, 51, 41, 14, 38, 69, 87, 28, 56, 76, 46, 81, 18, 48, 64, 49, 9, 74, 19, 5, 44, 99, 91, 93, 87, 45, 45, 41, 17, 3, 46, 57, 6, 38, 70, 43, 58, 9, 22, 13, 84, 67, 94, 53, 67, 57, 1, 75, 82, 71, 32, 25, 69, 22, 17, 7, 18, 14, 99, 34, 16, 44, 42, 73, 34, 63, 16, 91, 71, 37, 56, 54, 56, 49, 6, 22, 57, 6, 48, 38, 76, 79, 14, 97, 52, 31, 55, 21, 96, 54, 6, 63, 49, 47, 36, 34, 10, 3, 77, 80, 39, 32, 34, 46, 32, 91, 67, 88, 97, 67, 77, 24, 45, 90, 72, 49, 72, 79, 69, 19, 84, 75, 82, 32, 73, 69, 18, 82, 71, 94, 62, 9, 25, 47, 55, 56, 37, 73, 95, 85, 39, 23, 61, 36, 64, 84, 84, 88, 62, 4, 6, 45, 78, 87, 29, 51, 55, 46, 84, 25, 39, 97, 86, 63, 43, 92, 70, 32, 64, 16, 68, 55, 38, 80, 90, 53, 64, 25, 40, 25, 28, 46, 22, 58, 84, 50, 60, 91, 95, 43, 67, 33, 40, 52, 47, 34, 95, 68, 17, 11, 83, 37, 65, 72, 16, 6, 24, 31, 30, 16, 8, 57, 61, 29, 14, 44, 30, 73, 34, 24, 68, 1, 8, 7, 4, 6, 92, 99, 73, 61, 9, 55, 97, 25, 78, 64, 30, 53, 95, 11, 68, 2, 19, 80, 82, 85, 24, 11, 9, 9, 86, 76, 61, 93, 34, 17, 50, 78, 67, 22, 38, 27, 28, 34, 51, 5, 97, 32, 9, 91, 94, 77, 44, 12, 56, 77, 96, 31, 87, 5, 92, 24, 32, 4, 16, 66, 20, 65, 95, 86, 38, 32, 12, 65, 65, 14, 21, 13, 97, 30, 56, 90, 58, 99, 2, 65, 76, 49, 48, 14, 5, 39, 38, 37, 42, 5, 54, 14, 22, 48, 51, 59, 79, 15, 76, 95, 28, 96, 7, 25, 77, 62, 14, 34, 13, 67, 51, 40, 16, 98, 53, 72, 88, 42, 8, 81, 47, 13, 94, 20, 12, 45, 78, 42, 59, 5, 36, 38, 1, 95, 14, 29, 56, 80, 15, 20, 46, 65, 59, 13, 14, 64, 85, 1, 5, 44, 33, 3, 9, 27, 74, 20, 23, 4, 62, 33, 8, 49, 22, 60, 43, 36, 89, 51, 15, 3, 70, 12, 19, 81, 77, 32, 44, 61, 84, 100, 56, 16, 55, 64, 94, 28, 36, 68, 31, 49, 52, 91, 97, 74, 50, 92, 61, 38, 94, 27, 40, 63, 38, 10, 95, 14, 41, 90, 26, 24, 90, 34, 92, 96, 97, 85, 23, 84, 53, 6, 32, 56, 96, 81, 29, 45, 72, 41, 35, 65, 67, 26, 79, 5, 36, 26, 70, 76, 15, 96, 52, 4, 29, 43, 99, 77, 79, 74, 61, 83, 79, 44, 39, 26, 24, 19, 70, 47, 60, 56, 11, 26, 82, 42, 82, 17, 67, 4, 92, 81, 99, 95, 37, 79, 89, 87, 7, 68, 12, 19, 50, 42, 63, 40, 67, 38, 59, 89, 85, 70, 44, 47, 47, 25, 40, 29, 41, 58, 32, 85, 91, 82, 79, 27, 12, 68, 65, 70, 87, 77, 41, 36, 18, 3, 28, 37, 92, 86, 25, 76, 7, 68, 75, 53, 93, 14, 33, 85, 72, 16, 69, 62, 97, 100, 40, 60, 19, 56, 82, 5, 32, 22, 92, 2, 76, 19, 38, 67, 56, 62, 95, 62, 81, 69, 15, 25, 34, 47, 62, 57, 63, 82, 18, 11, 81, 9, 23, 51, 65, 4, 55, 48, 25, 47, 49, 100, 17, 38, 66, 73, 51, 60, 34, 32, 80, 48, 8, 14, 47, 69, 22, 9, 51, 40, 71, 83, 100, 93, 34, 64, 96, 88, 64, 72, 86, 12, 71, 3, 50, 89, 75, 52, 100, 8, 83, 80, 8, 43, 45, 6, 11, 66, 66, 13, 57, 36, 96, 9, 29, 29, 72, 76, 68, 35, 48, 54, 99, 70, 56, 100, 58, 82, 51, 10, 41, 86, 41, 100, 28, 85, 5, 90, 2, 70, 55, 11, 6, 50, 19, 86, 78, 42, 13, 45, 29, 12, 50, 27, 34, 57, 78, 43, 38, 28, 52, 31, 65, 92, 30, 44, 28, 35, 86, 30, 56, 40, 92, 13, 89, 10, 50, 18, 51, 63, 14, 79, 26, 64, 57, 59, 72, 34, 2, 10, 14, 53, 92, 78, 97, 21, 74, 24, 7, 59, 5, 15, 98, 96, 27, 38, 5, 77, 55, 56, 91, 20, 86, 68, 35, 43, 27, 7, 76, 80, 68, 41, 84, 59, 19, 80, 31, 92, 56, 90, 2, 60, 4, 51, 56, 30, 88, 60, 58, 94, 67, 100, 13, 5, 68, 48, 47, 46, 54, 74, 77, 73, 15, 12, 31, 85, 92, 13, 28, 99, 2, 29, 58, 5, 79, 13, 87, 18, 25, 96, 11, 43, 96, 23, 47, 15, 22, 45, 12, 27, 71, 88, 99, 37, 99, 29, 73, 42, 42, 100, 40, 95, 80, 50, 100, 10, 62, 38, 27, 38, 33, 89, 33, 80, 11, 31, 94, 85, 76, 5, 11, 98, 44, 10, 86, 43, 90, 58, 36, 83, 9, 76, 30, 88, 25, 29, 97, 38, 18, 75, 28, 50, 63, 60, 30, 25, 90, 75, 9, 17, 32, 72, 14, 75, 33, 51, 17, 74, 8, 53, 9, 16, 80, 38, 55, 56, 18, 3, 93, 35, 77, 20, 36, 91, 79, 17, 16, 21, 92, 76, 37, 23, 47, 3, 49, 31, 53, 18, 5, 61, 22, 13, 28, 1, 2, 35, 56, 19, 37, 100, 5, 66, 20, 40, 56, 50, 57, 23, 70, 100, 99, 59, 22, 97, 61, 22, 80, 13, 39, 84, 25, 60, 48, 5, 60, 1, 39, 67, 19, 75, 67, 75, 40, 38, 14, 48, 39, 22, 70, 9, 21, 20, 67, 94, 17, 79, 16, 96, 91, 54, 31, 68, 14, 30, 72, 73, 30, 10, 92, 100, 36, 58, 74, 76, 47, 39, 23, 85, 61, 44, 45, 81, 64, 63, 75, 32, 41, 90, 79, 32, 43, 9, 99, 8, 38, 70, 33, 19, 31, 24, 18, 66, 33, 91, 93, 79, 81, 67, 63, 41, 11, 60, 22, 74, 22, 48, 5, 63, 37, 83, 46, 31, 43, 96, 39, 32, 17, 23, 50, 47, 46, 19, 12, 78, 61, 57, 8, 41, 23, 70, 82, 33, 29, 55, 6, 3, 2, 62, 65, 90, 96, 62, 72, 90, 57, 62, 21, 73, 84, 22, 19, 29, 40, 82, 58, 100, 38, 65, 93, 61, 87, 74, 45, 67, 28, 3, 69, 81, 16, 85, 70, 12, 46, 93, 1, 2, 55, 74, 74, 38, 95, 44, 67, 87, 26, 76, 38, 15, 41, 30, 27, 27, 3, 72, 93, 82, 26, 62, 14, 41, 98, 83, 52, 44, 76, 5, 45, 82, 30, 71, 19, 24, 14, 37, 10, 91, 13, 48, 6, 5, 29, 84, 31, 32, 55, 75, 65, 80, 88, 79, 21, 86, 13, 24, 29, 40, 80, 25, 21, 9, 95, 92, 85, 9, 28, 94, 51, 92, 93, 56, 96, 22, 40, 26, 5, 46, 53, 21, 78, 40, 99, 50, 25, 64, 25, 53, 55, 5, 30, 76, 13, 24, 19, 97, 84, 46, 43, 87, 90, 87, 42, 85, 60, 33, 63, 16, 31, 15, 37, 8, 54, 87, 9, 79, 50, 33, 83, 57, 37, 64, 84, 2, 40, 2, 50, 23, 99, 92, 9, 88, 31, 3, 73, 42, 87, 87, 58, 17, 1, 46, 76, 6, 32, 84, 36, 34, 17, 71, 90, 5, 34, 73, 6, 73, 26, 56, 48, 24, 99, 8, 12, 81, 10, 36, 23, 49, 74, 32, 17, 26, 77, 93, 31, 60, 28, 67, 93, 96, 37, 34, 1, 70, 58, 58, 95, 83, 65, 42, 7, 64, 49, 70, 96, 11, 57, 70, 11, 30, 1, 27, 55, 29, 71, 85, 89, 99, 3, 81, 94, 91, 15, 94, 61, 24, 4, 7, 7, 68, 48, 13, 83, 48, 34, 79, 10, 90, 100, 20, 71, 1, 47, 25, 29, 17, 61, 69, 15, 16, 50, 61, 6, 16, 6, 66, 39, 9, 24, 97, 77, 71, 9, 59, 71, 94, 89, 80, 83, 89, 100, 5, 41, 46, 29, 21, 14, 42, 90, 81, 57, 91, 41, 62, 58, 46, 80, 48, 55, 3, 45, 83, 26, 5, 93, 96, 99, 82, 75, 33, 70, 26, 38, 62, 71, 18, 82, 37, 11, 71, 17, 67, 13, 57, 81, 70, 54, 60, 18, 60, 14, 62, 42, 91, 18, 35, 86, 16, 68, 13, 1, 89, 38, 38, 50, 61, 7, 31, 97, 18, 54, 13, 36, 66, 21, 16, 36, 74, 27, 5, 86, 41, 18, 27, 31, 35, 13, 69, 51, 80, 33, 51, 20, 70, 40, 69, 82, 98, 100, 78, 15, 5, 42, 51, 70, 14, 66, 57, 88, 93, 61, 25, 85, 78, 3, 67, 65, 16, 87, 15, 47, 19, 17, 67, 41, 8, 87, 22, 5, 86, 100, 72, 42, 93, 22, 12, 7, 39, 68, 46, 83, 81, 70, 19, 10, 72, 86, 74, 39, 24, 40, 38, 43, 8, 56, 83, 67, 42, 4, 24, 80, 55, 95, 21, 100, 68, 84, 6, 58, 4, 3, 41, 84, 72, 11, 45, 95, 48, 71, 86, 72, 10, 75, 14, 70, 82, 96, 36, 23, 51, 59, 54, 58 };
uint32_t coeffs[COEFF_MAX] = { 5, 27, 57, 72, 10, 62, 30, 13, 16, 22, 48, 87, 32, 93, 33, 80, 15, 70, 51, 24, 96, 16, 45, 77, 63, 81, 52, 13, 91, 5, 70, 96, 31, 78, 19, 93, 91, 100, 57, 6, 73, 5, 44, 5, 49, 77, 36, 63, 98, 38, 38, 94, 53, 83, 70, 15, 15, 21, 79, 5, 78, 1, 52, 60, 78, 23, 52, 69, 22, 9, 74, 95, 65, 18, 51, 65, 46, 38, 27, 43, 75, 16, 88, 79, 98, 10, 45, 64, 30, 23, 21, 59, 75, 24, 71, 53, 46, 22, 21, 20, 82, 94, 14, 98, 63, 16, 62, 8, 53, 40, 3, 79, 56, 42, 9, 5, 51, 53, 69, 33, 27, 41, 91, 2, 64, 61, 54, 10, 35, 26, 29, 68, 71, 94, 66, 86, 9, 79, 93, 13, 19, 47, 91, 74, 89, 99, 30, 39, 3, 50, 71, 29, 90, 14, 82, 54, 74, 87, 15, 60, 64, 95, 28, 35, 88, 45, 20, 48, 23, 64, 60, 41, 63, 2, 66, 51, 52, 96, 41, 54, 45, 64, 34, 35, 77, 68, 40, 50, 54, 54, 62, 70, 48, 89, 4, 87, 33, 75, 86, 7, 38, 97, 48, 100, 98, 13, 2, 1, 60, 43, 6, 5, 6, 91, 39, 34, 58, 30, 35, 64, 83, 96, 33, 82, 36, 88, 68, 20, 62, 53, 27, 51, 1, 74, 3, 98, 38, 4, 50, 98, 98, 55, 2, 55, 97, 92, 88, 55, 21, 75, 70, 55, 70, 54, 36, 6, 41, 55, 25, 54, 59, 51, 4, 59, 76, 58, 8, 14, 14, 57, 63, 63, 63, 64, 18, 59, 7, 57, 65, 79, 31, 34, 33, 53, 39, 20, 58, 31, 26, 82, 84, 84, 85, 40, 94, 60, 97, 53, 25, 10, 9, 87, 25, 23, 2, 42, 33, 8, 50, 98, 38, 33, 83, 22, 85, 22, 41, 42, 4, 18, 75, 88, 1, 11, 27, 46, 71, 75, 98, 47, 37, 58, 34, 61, 32, 35, 54, 65, 95, 55, 62, 32, 87, 96, 6, 71, 69, 98, 64, 73, 16, 39, 12, 68, 49, 90, 14, 71, 64, 63, 18, 52, 21, 3, 64, 52, 89, 17, 16, 83, 72, 29, 67, 10, 77, 72, 81, 97, 69, 44, 69, 84, 34, 80, 52, 35, 69, 17, 5, 85, 79, 74, 88, 99, 28, 52, 3, 17, 20, 70, 99, 43, 51, 17, 53, 27, 40, 33, 23, 61, 28, 44, 44, 62, 23, 47, 48, 44, 15, 4, 80, 94, 30, 67, 44, 57, 70, 98, 73, 42, 68, 24, 84, 18, 92, 88, 96, 32, 72, 18, 92, 100, 61, 87, 13, 36, 86, 12, 31, 100, 15, 10, 45, 44, 28, 41, 1, 50, 38, 73, 91, 5, 48, 26, 74, 40, 14, 69, 71, 85, 39, 14, 36, 99, 100, 48, 34, 85, 59, 16, 37, 26, 25, 81, 69, 5, 73, 69, 54, 11, 94, 44, 67, 93, 21, 93, 32, 34, 61, 54, 19, 99, 67, 54, 50, 19, 54, 35, 55, 64, 51, 91, 41, 27, 24, 10, 31, 96, 30, 36, 58, 75, 79, 77, 68, 52, 69, 51, 85, 81, 57, 55, 80, 23, 61, 81, 93, 66, 15, 48, 29, 65, 90, 70, 92, 13, 31, 74, 61, 60, 10, 70, 87, 40, 46, 54, 91, 66, 56, 76, 47, 12, 82, 78, 87, 42, 58, 79, 7, 72, 78, 88, 89, 68, 57, 32, 32, 39, 5, 44, 50, 66, 66, 36, 6, 11, 41, 48, 77, 97, 23, 23, 60, 5, 52, 46, 98, 9, 77, 5, 80, 6, 92, 20, 25, 100, 51, 57, 38, 8, 52, 87, 73, 17, 75, 78, 80, 15, 26, 8, 63, 100, 82, 23, 56, 33, 20, 54, 41, 96, 58, 72, 54, 1, 92, 78, 100, 94, 86, 37, 1, 38, 75, 74, 6, 49, 3, 37, 16, 80, 44, 78, 32, 25, 100, 39, 9, 20, 92, 49, 67, 1, 73, 20, 1, 64, 98, 52, 57, 83, 88, 10, 72, 15, 35, 30, 15, 37, 66, 30, 69, 10, 8, 100, 86, 59, 90, 95, 30, 34, 95, 97, 34, 67, 68, 87, 82, 17, 38, 91, 100, 78, 100, 23, 44, 34, 52, 58, 22, 18, 88, 42, 79, 47, 41, 16, 5, 31, 62, 35, 64, 9, 83, 49, 27, 50, 87, 9, 67, 77, 51, 18, 6, 2, 92, 49, 87, 44, 58, 60, 13, 97, 2, 43, 43, 94, 10, 100, 24, 72, 34, 39, 80, 68, 40, 6, 17, 78, 66, 35, 54, 16, 4, 11, 69, 96, 11, 55, 91, 69, 67, 55, 65, 68, 49, 60, 61, 58, 59, 37, 29, 44, 27, 60, 11, 66, 66, 79, 96, 83, 14, 1, 51, 69, 12, 19, 16, 22, 26, 6, 42, 92, 12, 7, 59, 60, 18, 19, 18, 76, 7, 98, 19, 34, 58, 81, 99, 75, 59, 46, 57, 24, 47, 7, 93, 58, 26, 8, 31, 3, 66, 73, 94, 77, 31, 4, 89, 48, 22, 6, 23, 29, 55, 93, 14, 12, 73, 64, 86, 31, 10, 43, 55, 56, 1, 47, 65, 26, 6, 95, 28, 71, 67, 73, 100, 97, 76, 88, 44, 50, 45, 18, 30, 99, 10, 43, 63, 34, 6, 48, 65, 15, 42, 71, 22, 95, 69, 86, 20, 74, 81, 100, 97, 99, 72, 96, 48, 100, 83, 91, 49, 27, 61, 30, 25, 22, 72, 39, 56, 29, 39, 72, 44, 32, 42, 17, 26, 62, 3, 46, 35, 83, 97, 31, 33, 20, 78, 80, 19, 60, 23, 19, 86, 83, 48, 63, 56, 71, 53, 11, 100, 91, 34, 95, 23, 27, 11, 48, 88, 13, 45, 75, 47, 41, 57, 80, 13, 35, 59, 31, 94, 81, 2, 32, 15, 49, 46, 71, 72, 98, 33, 71, 89, 67, 65, 11, 93, 27, 10, 33, 40, 55, 7, 38, 47, 15, 69, 59, 49, 28, 42, 95, 60, 43, 26, 27, 43, 23, 97, 14 };