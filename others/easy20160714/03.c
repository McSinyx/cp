#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char n, i;
	short *a, b;
	long k;

	fscanf(f, "%hhd %ld", &n, &k);
	a = malloc(n * sizeof(short));

	for (i = 0; i < n; i++)
		fscanf(f, "%hd", a + i);

	for (i = 0; i < n && k > 0; i++) {
		fscanf(f, "%hd", &b);
		k -= b - a[i];
	}
	
	fclose(f);

	f = fopen("OUT.TXT", "w");

	fprintf(f, "%hhd\n", (n - i) ? i : -1);

	fclose(f);

	return 0;
}
