#include <stdio.h>
#include <stdlib.h>

int cmp(const void *x, const void *y)
{
	return *(int *) x - *(int *) y;
}

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int n, i, *a, r = 1;

	fscanf(f, "%d", &n);
	a = malloc(n * sizeof(int));

	for (i = 0; i < n; i++)
		fscanf(f, "%d", a + i);

	fclose(f);

	qsort(a, n, sizeof(int), cmp);

	for (i = 1; i < n; i++)
		if (a[i] > a[i - 1])
			r++;

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%d\n", r);
	fclose(f);

	return 0;
}
