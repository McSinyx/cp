#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int m, n, *a, i, l;

	fscanf(f, "%d %d %d", &m, &n, &i);
	n *= m;
	a = malloc(n * sizeof(int));

	for (i = 0; i < n; i++)
		fscanf(f, "%d", a + i);

	fclose(f);

	l = m = *a;

	for (i = 1; i < n; i++)
		if (a[i] > m)
			m = a[i];

	for (i = 1; i < n; i++)
		if (a[i] < l)
			l = a[i];

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%d\n", m - l);
	fclose(f);

	return 0;
}
