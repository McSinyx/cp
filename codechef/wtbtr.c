#include <stdio.h>
#include <stdlib.h>

int cmpl(const void *x, const void *y)
{
	long tmp = *(long *) x - *(long *) y;
	if (tmp > 0)
		return 1;
	if (tmp)
		return -1;
	return 0;
}

int main()
{
	int i, n, t;
	long x, y, u[10000], v[10000];
	scanf("%d", &t);

	while (t--) {
		scanf("%d", &n);
		for (i = 0; i < n; ++i) {
			scanf("%ld %ld", &x, &y);
			u[i] = x + y;
			v[i] = x - y;
		}

		qsort(u, n, sizeof(long), cmpl);
		qsort(v, n, sizeof(long), cmpl);

		long tmp, min = u[n - 1] - *u;
		for (i = 1; i < n; ++i)
			if ((tmp = u[i] - u[i - 1]) < min)
				min = tmp;
		for (i = 1; i < n; ++i)
			if ((tmp = v[i] - v[i - 1]) < min)
				min = tmp;

		printf("%.1f\n", min / 2.0);
	}

	return 0;
}
