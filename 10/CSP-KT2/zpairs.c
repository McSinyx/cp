#include <stdio.h>

int main()
{
	short m, n, i, j, v = 0;
	long a[10000], b;

	scanf("%hd %hd", &n, &m);
	for (i = 0; i < n; i++)
		scanf("%ld", &a[i]);

	i = 0;
	for (j = 0; j < m; j++) {
		if (i >= n)
			break;
		scanf("%ld", &b);
		while (b > a[i])
			i++;
		if (b == a[i]) {
			v++;
			i++;
		}
	}

	printf("%hd\n", v);

	return 0;
}
