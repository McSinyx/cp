#include <stdio.h>
#include <stdlib.h>

#define ul unsigned long
#define LEN 1000001
#define P_LEN 78498

ul PRIMES[P_LEN];

ul *psearch(ul key)
{
	ul lo = 0, hi = P_LEN, mid;
	while (lo < hi) {
		if (key < PRIMES[mid = (lo + hi) / 2])
			hi = mid;
		else
			lo = mid + 1;
	}
	return PRIMES + lo;
}

void factorange(ul *d, ul prime, ul start, ul stop)
{
	ul i = 0;
	for (; stop; i += stop /= prime);
	for (start -= 1; start; i -= start /= prime);
	*d *= i * 2 + 1;
	*d %= 111539786;
}

int main()
{
	FILE *fi = fopen("LCM.INP", "r"), *fo = fopen("LCM.OUT", "w");
	char t;
	ul a, b, c = 0, d, *i = calloc(LEN, sizeof(ul)), *j;

	for (a = 2; a < 1001; a++)
		if (!i[a]) {
			for (b = a * a; b < LEN; b += a)
				i[b] = 1;
			PRIMES[c++] = a;
		}
	for (; a < LEN; a++)
		if (!i[a])
			PRIMES[c++] = a;
	free(i);

	fscanf(fi, "%hhd\n", &t);
	for (; t--;) {
		fscanf(fi, "%ld %ld\n", &a, &b);
		j = psearch(b);
		for (d = 1, i = PRIMES; i < j; factorange(&d, *i++, a, b));
		fprintf(fo, "%ld\n", d);
	}

	fclose(fi);
	fclose(fo);
	return 0;
}
