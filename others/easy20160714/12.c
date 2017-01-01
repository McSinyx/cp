#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	short m, n, i, a;
	char b[10000] = {};

	fscanf(f, "%hd %hd", &n, &m);
	for (i = 0; i < m; i++) {
		fscanf(f, "%hd", &a);
		b[a - 1] = 1;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%hd\n", n - m);

	for (i = 0; i < n; i++)
		if (!b[i])
			fprintf(f, "%hd ", i + 1);

	fputc(10, f);
	fclose(f);

	return 0;
}
