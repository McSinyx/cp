#include <stdio.h>

int main()
{
	char t;
	size_t n, tmp, zeros, twos;

	scanf("%hhd", &t);
	while (t--) {
		scanf("%zu", &n);
		for (size_t i = zeros = twos = 0; i < n; ++i) {
			scanf("%zu", &tmp);
			if (!tmp)
				zeros++;
			else if (tmp == 2)
				twos++;
		}
		printf("%zu\n", zeros * (zeros - 1) + twos * (twos - 1) >> 1);
	}

	return 0;
}
