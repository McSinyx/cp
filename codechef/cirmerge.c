#include <stdio.h>

int main()
{
	int t, n, i, j, k;
	long long tmp, a[400][400], p[400][400] = {};

	for (scanf("%d", &t); t--; printf("%lld\n", tmp)) {
		scanf("%d", &n);
		for (i = 0; i < n; ++i)
			scanf("%lld", *a + i);

		for (i = 1; i < n; ++i)
			for (j = 0; j < n; ++j) {
				p[i][j] = p[i-1][j];
				for (k = 1; k < i; ++k) {
					tmp = p[k-1][j] + p[i-k][(j+k)%n];
					if (tmp < p[i][j])
						p[i][j] = tmp;
				}
				p[i][j] += a[i][j] = a[i-1][j] + a[0][(i+j)%n];
			}

		long long *m = p[n-1];
		tmp = *m;
		for (i = 1; i < n; ++i)
			if (m[i] < tmp)
				tmp = m[i];
	}

	return 0;
}
