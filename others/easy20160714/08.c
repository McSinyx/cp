#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define sqr(x) x * x

int cmp(const void *x, const void *y)
{
	return *(unsigned long *) x - *(unsigned long *) y;
}

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char n, i, j, s[5] = {78, 79, 10};
	unsigned long *a, c;
	unsigned long long b;

	fscanf(f, "%hhd", &n);
	a = malloc(n * sizeof(unsigned long));

	for (i = 0; i < n; i++)
		fscanf(f, "%ld", a + i);

	fclose(f);

	qsort(a, n, sizeof(unsigned long), &cmp);

	for (i = 0; i + 1 < n; i++)
		for (j = i + 1; j < n; j++) {
			b = sqr(a[i]) + sqr(a[j]);

			c = (unsigned long) sqrt(b);

			if (sqr(c) == b && bsearch(&c, a, n, 4, &cmp) != NULL) {
				s[0] = 89;
				s[1] = 69;
				s[2] = 83;
				s[3] = 10;

				break;
			}
		}

	f = fopen("OUT.TXT", "w");

	fputs(s, f);

	fclose(f);

	return 0;
}
