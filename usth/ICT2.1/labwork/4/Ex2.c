/*
 * Read n from stdin and print all primes from 1 to n to stdout.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>
#include <stdlib.h>

void subsieve(int *mask, int n, int i, int j)
{
	if (j > n)
		return;
	mask[j] = 1;
	subsieve(mask, n, i, i + j);
}

void sieve(int *mask, int n, int i)
{
	if (i * i > n)
		return;
	if (!mask[i])
		subsieve(mask, n, i, i + i);
	sieve(mask, n, i + 1);
}

void print_primes(int *mask, int n)
{
	if (!n)
		return;
	if (!mask[n])
		printf("%d\n", n);
	print_primes(mask, n - 1);
}

int main()
{
	int n;
	scanf("%d", &n);

	int *notprime = calloc(n + 1, sizeof(int));
	notprime[0] = notprime[1] = 1;
	sieve(notprime, n, 2);
	print_primes(notprime, n);

	return 0;
}
