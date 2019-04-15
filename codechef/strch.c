#include <stdio.h>
#include <stdlib.h>

int main()
{
	int t;
	long n, i, j;
	long long res;
	char *s = malloc(1000001), x;

	scanf("%d", &t);
	while (t--) {
		scanf("%ld", &n);
		fgets(s, n, stdin);
		res = n * (n + 1) / 2;
		scanf("%s %c", s, &x);

		for (i = 0; i < n; ++i) {
			if (s[i] == x)
				continue;
			for (j = i; j < n && s[j] - x; ++j);
			res -= (j - i) * (j - i + 1) / 2;
			i = j;
		}

		printf("%lld\n", res);
	}

	return 0;
}
