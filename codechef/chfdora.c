#include <stdio.h>

int min(int a, int b)
{
	return (a < b) ? a : b;
}

int main()
{
	int t, n, m;

	scanf("%d", &t);
	while (t--) {
		scanf("%d %d", &n, &m);
		size_t a[n][m];
		for (int i = 0; i < n; ++i)
			for (int j = 0; j < m; ++j)
				scanf("%zu", a[i] + j);

		size_t count = 0;
		for (int i = 0; i < n; ++i)
			for (int j = 0; j < m; ++j) {
				int max = min(min(i, j), min(n-i, m-j)-1);
				for (int k = 0;
				     k <= max && a[i+k][j] == a[i-k][j]
				              && a[i][j+k] == a[i][j-k];
				     count++, ++k);
			}
		printf("%zu\n", count);
	}

	return 0;
}
