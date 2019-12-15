#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main()
{
	long i, j;
	char prime[44712] = {0, 0, [2 ... 44711] = 1};
	for (i = 2; i < 212; i++)
		if (prime[i])
			for (j = i * i; j < 44712; j += i)
				prime[j] = 0;


	long primes[4648];
	j = 0;
	for (i = 0; i < 44712; i++)
		if (prime[i])
			primes[j++] = i;

	long l, r;
	scanf("%ld %ld", &l, &r);

	long imax = (long) sqrt(r);
	for (i = 0; i < 4648; i++)
		if (primes[i] > imax) {
			imax = i;
			break;
		}

	r -= l - 1;
	long *list = malloc(r * 4);
	for (i = 0; i < r; i++)
		list[i] = 1;

	long prime0, l0;
	for (i = 0; i < imax; i++) {
		prime0 = primes[i];
		l0 = (l % prime0) ? (prime0 - (l % prime0)) : 0;
		l0 = (l + l0 > prime0 * prime0) ? l0 : (prime0 * prime0 - l);
		for (j = l0; j < r; j += prime0)
			list[j] = 0;
	}

	long val = 0;
	for (i = 0; i < r; i++)
		if (list[i])
			val++;

	printf("%ld\n", val);

	return 0;
}
