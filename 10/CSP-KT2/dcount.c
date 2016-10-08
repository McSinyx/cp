#include <stdio.h>

/* More than 8MB is used by this program, for *efficiency*. */

int main()
{
	long n, i, a0, m = 0, max = 0;
	long a[100001] = {}, b[100001];

	scanf("%ld", &n);
	for (i = 0; i < n; i++) {
		scanf("%ld", &a0);
		if (!a[a0]) {
			b[m] = a0;
			m++;
		}
		a[a0]++;
	}

	for (i = 0; i < m; i++)
		if (a[b[i]] > max)
			max = a[b[i]];

	printf("%ld %ld\n", m, max);

	return 0;
}
