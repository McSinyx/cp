#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char N, P[10] = {3, 5, 7, 11, 13, 17, 19, 23, 29, 31}, **A, *B, *D, *E;
long C = 0;

int cmp(const void *x, const void *y)
{
	return (int) (*(char *) x - *(char *) y);
}

void circle(FILE *f, char idx)
{
	char i, tmp;

	if (idx == N * 2) {
		tmp = *D + D[idx - 1];
		if (bsearch(&tmp, P, 10, 1, cmp) != NULL) {
			C++;
			E = realloc(E, C * N * 2);
			memcpy(E + (C - 1) * N * 2, D, N * 2);
		}
		return;
	}

	for (i = 1; i < *A[D[idx - 1] - 1]; i++) {
		tmp = A[D[idx - 1] - 1][i];
		if (B[tmp - 1]) {
			B[tmp - 1] = 0;
			D[idx] = tmp;
			circle(f, idx + 1);
			B[tmp - 1] = 1;
		}
	}
}

int main()
{
	FILE *f = fopen("CIRCLE.INP", "r");
	long i;
	char j;

	fscanf(f, "%hhd", &N);
	fclose(f);

	A = malloc(N * 2 * sizeof(char *));
	for (i = 0; i < N * 2; i++) {
		A[i] = malloc(sizeof(char));
		*A[i] = 1;
		for (j = 0; j < 10; j++)
			if (i + 1 < P[j] && P[j] < N * 2 + i + 2) {
				A[i] = realloc(A[i], ++*A[i]);
				A[i][*A[i] - 1] = P[j] - i - 1;
			}
	}

	B = calloc(N * 2, sizeof(char));
	for (i = 1; i < N * 2; i++)
		B[i] = 1;
	D = malloc(N * 2);
	D[0] = 1;
	E = malloc(1);
	circle(f, 1);

	f = fopen("CIRCLE.OUT", "w");
	fprintf(f, "%ld\n", C);
	for (i = 0; i < C * N * 2; i++) {
		for (; i % (N * 2) < N * 2 - 1; i++)
			fprintf(f, "%hhd ", E[i]);
		fprintf(f, "%hhd\n", E[i]);
	}
	fclose(f);

	return 0;
}
