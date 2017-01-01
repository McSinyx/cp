#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char n, i, j;
	short m, *a;

	fscanf(f, "%hhd %hd", &n, &m);
	a = malloc(n * sizeof(short));

	for (i = 0; i < n; i++)
		fscanf(f, "%hd", a + i);

	fclose(f);

	f = fopen("OUT.TXT", "w");

	for (i = 0; i + 1 < n; i++)
		for (j = i + 1; j < n; j++)
			if (a[i] + a[j] == m) {
				fprintf(f, "%hhd %hhd\n", i + 1, j + 1);

				fclose(f);

				return 0;
			}

	fputs("-1\n", f);

	fclose(f);

	return 0;
}
