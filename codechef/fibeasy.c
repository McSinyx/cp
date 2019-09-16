#include <stdio.h>

const char LAST[] = "0923";

int main()
{
	int t, c;
	long n;

	scanf("%d", &t);
	while (t--) {
		scanf("%ld", &n);
		if (n == 2 || n == 3) {
			puts("1");
			continue;
		}

		for (c = 0; n >>= 1; c++);
		printf("%c\n", LAST[c % 4]);
	}

	return 0;
}
