#include <stdio.h>

int main()
{
	char w, h, i, j, t = -1, r = -1, b = -1, l = -1;

	scanf("%hhd %hhd\n", &h, &w);

	for (i = 0; i < h; i++) {
		for (j = 0; j < w; j++)
			if (getchar() == 42) {
				if (t < 0 && l < 0) {
					t = i;
					l = j;
				}
				b = (b < i) ? i : b;
				r = (r < j) ? j : r;
			}
		getchar();
	}

	for (i = 0; i < h; i++) {
		for (j = 0; j < w; j++)
			if (i >= t && i <= b && j >= l && j <= r)
				putchar(42);
			else
				putchar(46);
		putchar(10);
	}

	return 0;
}
