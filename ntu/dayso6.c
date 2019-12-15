#include <stdio.h>
#include <stdlib.h>

int main()
{
	short n, i;
	long long *a ;
	long long *b, tmp;

	scanf("%hd", &n);
	a = malloc(n * 8);
	b = malloc(n * 8);

	scanf("%ld", a);
	*b = *a;
	for (i = 1; i < n - 2; i++) {
		scanf("%ld", &a[i]);
		b[i] = (a[i] > a[i - 1]) ? a[i] : a[i - 1];
	}
	scanf("%ld %ld", &a[n - 2], &a[n - 1]);

	*b = *b + a[1] * 2;
	for (i = 1; i < n - 2; i++) {
		b[i] = b[i] + a[i + 1] * 2;
		if (b[i - 1] > b[i])
			b[i] = b[i - 1];
	}

	*b = *b + a[2] * 3;
	for (i = 1; i < n - 2; i++) {
		b[i] = b[i] + a[i + 2] * 3;
		if (b[i - 1] > b[i])
			b[i] = b[i - 1];
	}

	printf("%lld\n", b[n - 3]);

	return 0;
}
