#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	unsigned long long x, y, k, i;

	fscanf(f, "%lld %lld %lld", &x, &y, &k);

	fclose(f);

	i = y / (x * 6 + k) * 6;

	while (i * x + (i + 5) / 6 * k < y)
		i++;

	f = fopen("OUT.TXT", "w");

	fprintf(f, "%lld\n", i);

	fclose(f);

	return 0;
}
