#include <stdio.h>

int main()
{
	int t, n;

	scanf("%d", &t);
	while (t--) {
		int k = 0, hope[26] = {0};
		scanf("%d ", &n);
		for (int i = 0; i < n; ++i) {
			int c = getchar() - 'a';
			if (hope[c] - i > k)
				k = hope[c] - i;
			hope[c] = n + i;
		}
		printf("%d\n", k);
	}

	return 0;
}
