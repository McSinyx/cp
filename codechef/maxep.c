#include <stdio.h>

int main()
{
	long x = 1, y, n;
	int b, c, left = 1000;

	scanf("%ld %d", &n, &c);
	while (--left >= c && x < n) {
		printf("1 %ld\n", y = (x + n) / 2);
		fflush(stdout);

		scanf("%d", &b);
		if (b) {
			puts("2");
			fflush(stdout);
			left -= c;
			n = y;
		} else {
			x = y + 1;
		}
	}

	printf("3 %ld\n", x);
	return 0;
}
