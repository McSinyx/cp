#include <stdio.h>

int main()
{
	long long n, k, si, m, l, r, i, result;
	int t;
	scanf("%d\n", &t);

	while (t--) {
		scanf("%lld %lld\n", &n, &k);
		si = (k - 1) * k / 2;
		m = (n - si) / k;
		if (m < 1) {
			puts("-1");
			continue;
		} else if (m == 1) {
			puts("0");
			continue;
		}

		r = n - si - m * k;
		l = k - r;
		result = 1;

		for (i = 0; l--; i++) {
			result = result * (m + i) % 1000000007;
			result = result * (m + i - 1) % 1000000007;
		}
		for (; r--; i++) {
			result = result * (m + i) % 1000000007;
			result = result * (m + i + 1) % 1000000007;
		}

		printf("%lld\n", result);
	}

	return 0;
}
