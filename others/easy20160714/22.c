#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *fi = fopen("INP.TXT", "r"), *fo = fopen("OUT.TXT", "w");
	int n, m, i, j = 0, *a, b;

	fscanf(fi, "%d %d", &n, &m);
	a = malloc(n * sizeof(int));

	for (i = 0; i < n; i++)
		fscanf(fi, "%d", a + i);

	for (i = 0; i < m; i++) {
		fscanf(fi, "%d", &b);
		while (a[j] < b && j < n)
			fprintf(fo, "%d ", a[j++]);
		fprintf(fo, "%d ", b);
	}

	while (j < n)
		fprintf(fo, "%d ", a[j++]);

	fputc(10, fo);
	fcloseall();

	return 0;
}
