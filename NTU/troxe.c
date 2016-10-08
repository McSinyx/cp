#include <stdio.h>

int main()
{
	long k, i, x, t[7990] = {}, p;

	scanf("%ld", &k);
	for (i = 0; i < k; i++) {
		scanf("%ld", &x);
		t[x - 10102010]++;
	}

	x = 0;
	for (i = 0; i < 7990; i++) {
		p = t[i];
		if (p) {
			x += 100;
			if (p > 5)
				x += p - 5;
		}
	}

	printf("%ld\n", x);

	return 0;
}
