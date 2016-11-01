#include <stdio.h>


const long long a[] = {4, 3, 5, 6, 111, 222, 3333, 4444, 55555, 666666, 7777777,
                       88888888, 999999999, 123456789123456789,
                       1000000000000000000};

long long quadratic(long long x, char a, char b, char c)
{
	return a * x * x + b * x + c;
}

int main()
{
	char i;
	long long k, q;
	FILE *f;

	f = fopen("TRIGRID.TXT", "w");

	for (i = 0; i < 15; i++) {
		q = a[i] % 2016;
		k = a[i] / 2016 % 2016 * 252 * quadratic(q, 6, 10, 2);
		fprintf(f, "%d\n", (k + quadratic(q, 2, 5, 2) * q / 8) % 2016);
	}

	fclose(f);

	return 0;
}
