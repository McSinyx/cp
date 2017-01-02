#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char m, n, i, j;
	long *a, r;

	fscanf(f, "%hhd %hhd", &m, &n);
	a = malloc(m * n * sizeof(long));

	for (i = 0; i < n; i++)
		fscanf(f, "%ld", a + i);

	for (i = 1; i < m; i++) {
		fscanf(f, "%ld", a + i * n);
		for (j = 1; j < n; j++) {
			fscanf(f, "%ld", a + i * n + j);
			a[i * n + j] += a[i * n + j - n - 1];
		}
	}

	fclose(f);

	r = a[n - 1];

	for (i = n * 2 - 1; i < m * n; i += n)
		if (a[i] > r)
			r = a[i];

	for (i = m * (n - 1); i < m * n; i++)
		if (a[i] > r)
			r = a[i];

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%ld\n", r);
	fclose(f);

	return 0;
}
