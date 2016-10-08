#include <stdlib.h>
#include <stdio.h>

unsigned long long delta(long *a, short len)
{
	unsigned long long sum = 0, val, val0, left = 0;
	short i;

	for (i = 0; i <= len; i++)
		sum += a[i];
	val = sum;

	for (i = 0; i < len; i++) {
		left += a[i];
		val0 = llabs(sum - left * 2);
		if (val0 < val)
			val = val0;
	}

	return val;
}

int main()
{
	short n, q, *u, *v, i;
	scanf("%hd %hd", &n, &q);

	long *a = malloc(n * 4);
	for (i = 0; i < n; i++)
		scanf("%ld", &a[i]);

	u = malloc(q * 2);
	v = malloc(q * 2);
	for (i = 0; i < q; i++)
		scanf("%hd %hd", &u[i], &v[i]);

	for (i = 0; i < q; i++)
		printf("%lld\n", delta(a + u[i] - 1, v[i] - u[i]));

	return 0;
}
