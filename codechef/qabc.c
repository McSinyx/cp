#include <stdlib.h>
#include <stdio.h>

int main()
{
	int t, n, i;
	long *a = malloc(10000 * sizeof(long)), b;
	scanf("%d\n", &t);

	while (t--) {
		scanf("%d\n", &n);
		for (i = 0; i < n; i++)
			scanf("%ld", a + i);
		for (i = 0; i < n; i++) {
			scanf("%ld", &b);
			a[i] = b - a[i];
		}

		for (n--; --n; a++) {
			if (*a < 0) {
				puts("NIE");
				break;
			}
			if (*a) {
				a[1] -= *a * 2;
				a[2] -= *a * 3;
			}
		}

		if (n)
			continue;
		if (*a || *++a)
			puts("NIE");
		else
			puts("TAK");
	}

	return 0;
}
