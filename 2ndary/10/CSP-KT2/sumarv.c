#include <stdio.h>

int main()
{
	short n, i;
	long b[10001] = {};

	scanf("%hd", &n);
	for (i = 1; i <= n; i++) {
		scanf("%ld", &b[i]);
		b[i] *= i;
	}

	for (i = 1; i <= n; i++)
		printf("%ld ", b[i] - b[i - 1]);
	printf("\n");

	return 0;
}
