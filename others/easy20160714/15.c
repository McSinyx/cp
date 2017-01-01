#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *fi = fopen("INP.TXT", "r"), *fo = fopen("OUT.TXT", "w");
	int n, m, i, *a, *b, x, y;
	char signal;

	fscanf(fi, "%d %d", &n, &m);
	a = malloc(n * sizeof(int));
	b = malloc(n * sizeof(int));

	for (i = 0; i < n; i++)
		fscanf(fi, "%d %d", a + i, b + i);

	for (i = 0; i < m; i++) {
		fscanf(fi, "%hhd %d %d", &signal, &x, &y);
		x--;

		b[x] += (signal ^ 1) ? -y : y;
		if (b[x] < a[x]) {
			fprintf(fo, "BUY %d %d\n", x + 1, a[x] - b[x]);
			b[x] = a[x];
		}
	}

	fcloseall();

	return 0;
}
