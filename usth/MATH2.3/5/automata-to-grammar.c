#include <stdio.h>

int main()
{
	int n, b, j, k;

	scanf("%d", &n);
	for (int i = 0; i < n; ++i) {
		scanf("%d %d %d", &b, &j, &k);
		if (b)
			printf("%c -> $\n", 'S' + i);
		printf("%c -> 0%c\n%c -> 1%c\n", i+83, j+83, i+83, k+83);
	}

	return 0;
}
