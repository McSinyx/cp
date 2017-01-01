#include <stdio.h>

long gcd(long x, long y)
{
	long tmp;

	while (y) {
		tmp = x % y;
		x = y;
		y = tmp;
	}

	return x;
}

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	long l, r, a;
	short b;

	fscanf(f, "%ld %ld %ld %hd", &l, &r, &a, &b);

	fclose(f);

	a = a * b / gcd(a, b);

	l = (l % a) ? (l / a + 1) * a : l;

	f = fopen("OUT.TXT", "w");

	fprintf(f, "%ld\n", (r - l) / a + 1);

	fclose(f);

	return 0;
}
