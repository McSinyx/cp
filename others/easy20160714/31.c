#include <stdio.h>
#include <stdlib.h>

int cmp(const void *x, const void *y)
{
	return *(int *) x - *(int *) y;
}

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int n, *a, i, m;
	long r = 0;

	fscanf(f, "%d", &n);
	a = malloc(n * sizeof(int));

	for (i = 0; i < n; i++)
		fscanf(f, "%d", a + i);

	fclose(f);

	qsort(a, n, sizeof(int), cmp);
	m = a[n / 2];

	for (i = 0; i < n; i++)
		r += abs(a[i] - m);

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%ld\n", r);
	fclose(f);

	return 0;
}
