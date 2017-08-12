#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cmp(const void *x, const void *y)
{
	long z = *(long *) x - *(long *) y;
	if (z < 0)
		return -1;
	if (z)
		return 1;
	return 0;
}

int main()
{
	FILE *fi = fopen("EP.INP", "r"), *fo = fopen("EP.OUT", "w");
	char t;
	long a, b, c, p[1000001], q[1000001];
	long long count;

	for (a = 1; a < 1000001; a++) {
		p[a] = 1;
	}

	for (a = 2; a < 1001; a++)
		if (p[a] == 1)
			for (b = a; b < 1000001; b += a)
				p[b] *= a;

	fscanf(fi, "%hhd\n", &t);
	for (; t--;) {
		fscanf(fi, "%ld %ld\n", &a, &b);
		b -= a - 1;
		memcpy(q, p + a, b * sizeof(long));
		qsort(q, b, sizeof(long), cmp);
		count = 0;

		for (a = c = 1; a < b; a++)
			if (q[a] != q[a - 1]) {
				count += c * (c - 1) / 2;
				c = 1;
			} else {
				c++;
			}
		fprintf(fo, "%Ld\n", count);
	}

	fclose(fi);
	fclose(fo);
	return 0;
}
