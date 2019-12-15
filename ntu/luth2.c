#include <stdio.h>

long long modinv(long a, long b)
{
	/* From: http://rosettacode.org/wiki/Modular_inverse#C */

	long long t = 0, nt = 1, r = b, nr = a % b, q, tmp;

	while (nr) {
		q = r / nr;

		tmp = nt;
		nt = t - q * nt;
		t = tmp;

		tmp = nr;
		nr = r - q * nr;
		r = tmp;
	}

	return (t < 0) ? t + b : t;
}

long powmod(long a, long b, long k)
{
	if (b == 1)
		return a;

	long long p = powmod(a, b / 2, k);
	p = (b % 2) ? p * p * a % k : p * p % k;

	return p;
}

int main()
{
	short t, i;
	long a, b, k, j;
	long long c = 1;

	scanf("%hd", &t);

	for (i = t; i; i--) {
		scanf("%ld %ld %ld", &a, &b, &k);

		if (b < 0) {
			a = modinv(a, k) % k;
			b = -b;
		}

		printf("%ld\n", (b) ? powmod(a, b, k) : 1);
	}

	return 0;
}
