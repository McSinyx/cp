/*
 * Solve Towers of Hà Nội of height n, where towers are named foo, bar and baz.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>

void anoi(unsigned n, char *one, char *other, char *another)
{
	if (n == 0)
		return;

	anoi(n - 1, one, another, other);
	printf("Move from %s to %s\n", one, other);
	anoi(n - 1, another, other, one);
}

int main()
{
	unsigned n;

	scanf("%u", &n);
	anoi(n, "foo", "bar", "baz");

	return 0;
}
