#include <stdio.h>
#include <stdlib.h>

int sign(long x)
{
	return (x) ? ((x > 0) ? 1 : -1) : x;
}

int cmp(const void *x, const void *y)
{
	return sign(*(long *) x - *(long *) y);
}

int CMP(const void *x, const void *y)
{
	return -cmp(x, y);
}

int main()
{
	FILE *f = fopen("INTERVAL.INP", "r");
	short n, i, k = 0, *r;
	long c, x, *a, *b;

	fscanf(f, "%hd %ld %ld", &n, &c, &x);
	a = malloc(n * sizeof(long));
	b = malloc(n * sizeof(long));

	for (i = 0; i < n; i++)
		fscanf(f, "%ld %ld", a + i, b + i);

	fclose(f);

	r = calloc(n, sizeof(short));
	for (i = 0; i < n; i++)
		if (a[i] <= x && b[i] >= x)
			k += r[i] = 1;

	f = fopen("INTERVAL.OUT", "w");

	if (k) {
		fprintf(f, "%hd\n", k);

		for (i = 0; i < n; i++)
			if (r[i])
				fprintf(f, "%hd ", i + 1);
		putc(10, f);
	} else {
		qsort(a, n, sizeof(long), cmp);
		qsort(b, n, sizeof(long), CMP);

		free(r);
		r = malloc(2 * sizeof(short));
		for (i = 0; i < n && b[i] > x; i++);
		r[0] = (i == n) ? -c : b[i];
		for (i = 0; i < n && a[i] < x; i++);
		r[1] = (i == n) ? c : a[i];

		fprintf(f, "0\n%hd %hd\n", r[0], r[1]);
	}

	fclose(f);

	return 0;
}
