#include <stdio.h>

int main()
{
	long n, i;
	long unsigned_a[201] = {};
	long *a = &unsigned_a[100];
	char a0;
	long long v;

	scanf("%ld", &n);
	for (i = 0; i < n; i++) {
		scanf("%hhd", &a0);
		a[a0]++;
	}

	v = a[0] * (a[0] - 1) / 2;
	for (i = 1; i <= 100; i++)
		v += a[i] * a[-i];

	printf("%lld\n", v);

	return 0;
}
