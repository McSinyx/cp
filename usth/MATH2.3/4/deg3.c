#include <stdio.h>

int main()
{
	printf("(x y z)");
	for (int i = 0; i < 8; ++i)
		printf("\t(%d %d %d)", i & 4 && 1, i & 2 && 1, i & 1 && 1);
	putchar(10);

	for (int i = 0; i < 256; ++i) {
		printf("f%02x", i);
		for (int j = 0; j < 8; ++j)
			printf("\t%d", i & 1 << j && 1);
		putchar(10);
	}

	return 0;
}
