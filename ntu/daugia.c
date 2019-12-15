#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define idx(n) (n - 1) / 2 - 1

int main()
{
	long a, b, count = 0, i, j, n;
	scanf("%ld %ld", &a, &b);
	
	char *primes = malloc(b / 2 - 1);
	for (i = 3; i < b; i += 2)
		primes[idx(i)] = 1;

	for (i = 3; i < sqrtf((float) b); i += 2) {
		if (primes[idx(i)])
			for (j = i * i; j < b; j += i * 2)
				primes[idx(j)] = 0;
	}

	char k;
	for (i = 1; i < 10; i += 2)
		for (j = 0; j < 10; j++)
			for (k = 0; k < 10; k++) {
				n = i * 10001 + j * 1010 + k * 100;
				if (n >= b) {
					printf("%ld\n", count);
					return 0;
				}
				if (primes[idx(n)] && a <= n)
					count++;
			}
}
