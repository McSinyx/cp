#include <stdio.h>

int main()
{
	size_t n, f;
	int b = 0;

	scanf("%zu %zu", &n, &f);
	for (size_t i = 0; !(i >> n); ++i) {
		if (!(f & 1 << i))
			continue;
		if (b)
			printf(" | ");
		b = 1;
		printf(i & 1 ? "~(x0" : "~(~x0");
		for (size_t j = 1; j < n; ++j)
			if (i & 1 << j)
				printf(" | ~x%zu", j);
			else
				printf(" | x%zu", j);
		putchar(41);
	}
	putchar(10);

	return 0;
}
