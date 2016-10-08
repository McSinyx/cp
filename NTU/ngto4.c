#include <stdio.h>
#include <math.h>

#define idx(n) (n - 1) / 2 - 1

long primes[1000000];

int main()
{
	long i, j;
	char pdict[500001] = {[0 ... 500000] = 1};
	for (i = 3; i < 1000; i += 2)
		if (pdict[idx(i)])
			for (j = i * i; j < 1000000; j += i * 2)
				pdict[idx(j)] = 0;

	primes[0] = 2;
	j = 0;
	for (i = 3; i < 1000000; i += 2)
		if (pdict[idx(i)])
			primes[++j] = i;

	printf("%ld ", primes[78497]);
	printf("\n%ld\n", j);

	return 0;
}
