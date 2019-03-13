#include <stdio.h>

const char VOWELS[] = {97, 101, 105, 111, 117};

int main()
{
	char *c, s[1001];
	long t, n, i, j, tmp;

	scanf("%ld", &t);
	while (t--) {
		long vowels[32] = {};

		scanf("%ld", &n);
		for (i = 0; i < n; ++i) {
			tmp = 0;
			scanf("%s", &s);
			for (c = s; *c; ++c) {
				for (j = 0; VOWELS[j] ^ *c; ++j);
				tmp |= 1 << j;
			}
			++vowels[tmp];
		}

		tmp = vowels[31] * (vowels[31] - 1) / 2;
		for (i = 0; i < 31; ++i)
			for (j = i + 1; j < 32; ++j)
				tmp += ((i | j) == 31) * vowels[i] * vowels[j];
		printf("%ld\n", tmp);
	}

	return 0;
}
