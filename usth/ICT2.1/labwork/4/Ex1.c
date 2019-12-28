/*
 * Multiply two natural numbers from stdin and print the result to stdout.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>

int multiply(int a, int b)
{
	if (a > 0)
		return multiply(a - 1, b) + b;
	if (a < 0)
		return multiply(a + 1, b) - b;
	return 0;
}

int main()
{
	int a, b;

	scanf("%d %d", &a, &b);
	printf("%d\n", multiply(a, b));

	return 0;
}
