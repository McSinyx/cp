/*
 * Read an array of n int from stdin and print its sum to stdout
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>
#include <stdlib.h>

int sum(int n, int *a)
{
	int s = 0;
	while (n--)
		s += a[n];
	return s;
}

int main()
{
	int n;
	scanf("%d", &n);

	int *a = malloc(n * sizeof(int));
	for (int i = 0; i < n; ++i)
		scanf("%d", a + i);

	printf("%d\n", sum(n, a));
	return 0;
}
