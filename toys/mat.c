#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int rowcmp(float *row0, float *row1, int n)
{
	for (int i = 0; i < n; ++i) {
		if (row0[i])
			return 0;
		if (row1[i])
			return 1;
	}
	return 0;
}

/* Upper-triangularise matrix mat of size mxn */
void ut(float *mat, int m, int n)
{
	long i, j, k;
	float *current, *other, *tmp = malloc(n * sizeof(float));

	for (i = 0; i + 1 < m; ++i) {
		current = mat + i * n;
		for (j = i + 1; j < m; ++j) {
			other = mat + j * n;
			if (rowcmp(current, other, n)) {
				memcpy(tmp, current, n);
				memcpy(current, other, n);
				memcpy(other, tmp, n);
			}
		}

		for (j = i + 1; j < m; ++j) {
			for (k = 0; k < n && !mat[i*n + k]; ++k);
			if (k == n)
				break;

			float c = mat[j*n + k] / mat[i*n + k];
			mat[j*n + k] = 0.0; /* floating point imprecision */
			while (++k < n)
				mat[j*n + k] -= c * mat[i*n + k];
		}
	}
	free(tmp);
}

float *transpose(float *mat, int m, int n)
{
	float *result = malloc(m * n * sizeof(float));
	for (long i = 0; i < m; ++i)
		for (long j = 0; j < n; ++j)
			result[j*m + i] = mat[i*n + j];
	return result;
}

void printmatf(char *format, float *mat, int m, int n)
{
	for (long i = 0; i < m; ++i) {
		for (long j = 0; j < n; ++j)
			printf(format, mat[i*n + j]);
		putchar(10);
	}
}

int main()
{
	int n;
	puts("Please input the size of the square matrix:");
	fputs("n = ", stdout);
	scanf("%d", &n);

	long i, j, k, len = n * n * sizeof(float);
	float sum = 0.0, *a = malloc(len);
	puts("Now please input the matrix:");
	for (i = 0; i < n * n; ++i) {
		scanf("%f", a + i);
		sum += a[i];
	}
	printf("The sum of all the matrix elements: %.2f\n", sum);

	float *b = transpose(a, n, n);
	puts("The transpose of the matrix:");
	printmatf("%8.3f", b, n, n);
	free(a);

	b = realloc(b, len * 2);
	for (i = 0; i < n; ++i)
		for (j = 0; j < n; ++j)
			b[n*n + i*n + j] = i == j;
	a = transpose(b, n * 2, n);
	ut(a, n, n * 2);
	free(b);

	float det = 1.0;
	for (i = 0; i < n; ++i)
		det *= a[i*n*2 + i];
	printf("The determinant of the matrix: %.2f\n", det);

	if (!det) {
		puts("The given matrix is not invertible.");
		free(a);
		return 0;
	}

	for (i = n - 1; i >= 0; --i) {
		float d = a[i*n*2 + i];
		for (j = n; j < n * 2; ++j)
			a[i*n*2 + j] /= d;
		for (k = i - 1; k >= 0; --k) {
			float c = a[k*n*2 + i];
			for (j = n; j < n * 2; ++j)
				a[k*n*2 + j] -= a[i*n*2 + j] * c;
		}
	}

	b = transpose(a, n, n * 2);
	a = transpose(b + n * n, n, n);
	puts("The inverse of the matrix:");
	printmatf("%8.3f", a, n, n);
	free(a);
	free(b);

	return 0;
}
