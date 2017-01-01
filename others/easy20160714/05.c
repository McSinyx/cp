#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	unsigned long long x, y;
	char z = 1;

	fscanf(f, "%lld", &x);

	fclose(f);

	f = fopen("OUT.TXT", "w");

	y = x;

	while (y ^ 1) {
		if (y % 2)
			y = y / 2 + 1;
		else
			y /= 2;

		z++;
	}

	fprintf(f, "%hhd ", z);

	z = 1;

	while (x ^ 1) {
		x /= 2;
		z++;
	}

	fprintf(f, "%hhd\n", z);

	fclose(f);

	return 0;
}
