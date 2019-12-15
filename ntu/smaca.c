#include <stdlib.h>
#include <stdio.h>
#include <string.h>

long gcd(long a, long b)
{
	long c;
	while (b) {
		c = a % b;
		a = b;
		b = c;
	}
	return a;
}

int main()
{
	char m, n, i, j, l, val0 = 0, *val;
	long *k, *h, x, g;

	scanf("%hhd %hhd", &m, &n);

	val = malloc(n);
	for (i = 0; i < n; i++)
		val[i] = 1;

	k = malloc(m * 4);
	for (i = 0; i < m; i++)
		scanf("%ld", &k[i]);

	h = malloc(m * 4);
	for (i = 0; i < n; i++) {
		memcpy(h, k, m * 4);

		for (j = 0; j < m; j++) {
			scanf("%ld", &x);
			for (l = 0; l < m && x > 1; l++) {
				g = gcd(h[l], x);
				h[l] /= g;
				x /= g;
			}
			if (x > 1) {
				val[i] = 0;
				for (j++; j < m; j++)
					scanf("%ld", &x);
				break;
			}
		}
		
		if (val[i])
			val0++;
	}

	printf("%hhd\n", val0);
	for (i = 0; i < n; i++)
		if (val[i])
			printf("%hhd ", i + 1);
	puts("\b");

	return 0;
}
