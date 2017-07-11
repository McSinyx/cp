#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *fi = fopen("DIVSEQ.INP", "r"), *fo = fopen("DIVSEQ.OUT", "w");
	char t;
	unsigned short n;
	unsigned long d, i, *b, *c;
	long long *a, res;

	fscanf(fi, "%hhd", &t);
	for (; t; t--) {
		fscanf(fi, "%ld %hu", &d, &n);
		a = malloc(n * sizeof(long long));
		for (i = 0; i < n; i++) {
			fscanf(fi, "%Ld", a + i);
			a[i] %= d;
		}

		b = malloc(n * sizeof(long));
		c = calloc(d, sizeof(long));
		for (c[*b = *a % d] += *c = i = 1; i < n; i++)
			c[b[i] = (b[i - 1] + a[i]) % d]++;
		free(a);
		free(b);

		for (res = i = 0; i < d; i++)
			res += c[i] * (c[i] - 1) / 2;
		free(c);

		fprintf(fo, "%Ld\n", res);
	}

	fclose(fi);
	fclose(fo);
	return 0;
}
