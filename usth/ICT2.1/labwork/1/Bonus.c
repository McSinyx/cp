/*
 * Read an integer from stdin and print its prime factors to stdout
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>

int main()
{
	unsigned n, m = 0;

	scanf("%u", &n);

	for (unsigned i = 2; i * i <= n; ++i)
		while (n % i == 0) {
			printf(m++ ? " %u" : "%u", i);
			n /= i;
		}
	if (n != 1)
		printf(m++ ? " %u" : "%u", n);
	if (m)
		putchar(10);

	return 0;
}
