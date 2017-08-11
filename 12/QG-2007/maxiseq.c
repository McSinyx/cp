#include <math.h>
#include <stdio.h>

char is_in_u(long x)
{
	long y = (long) sqrt(x *= 2);
	return y * (y + 1) == x;
}

int main()
{
	FILE *f = fopen("MAXISEQ.INP", "r");
	short n, i, max = 0, start = -1;
	long a, b;

	fscanf(f, "%hd\n", &n);
	for (i = 0; i < n; i++) {
		b = a;
		fscanf(f, "%ld\n", &a);
		if (!is_in_u(a) || start >= 0 && b > a) {
			start = -1;
			continue;
		}
		if (start < 0)
			start = i;
		if (i - start >= max)
			max = i - start + 1;
	}
	fclose(f);

	f = fopen("MAXISEQ.OUT", "w");
	fprintf(f, "%hd\n", max);
	fclose(f);

	return 0;
}
