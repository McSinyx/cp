#include <stdlib.h>
#include <stdio.h>

int cmp(const void *x, const void *y)
{
	return *(long long *) x - *(long long *) y;
}

int main()
{
	short n, i;
	long b;
	scanf("%hd %ld", &n, &b);
	long long *s = malloc(n * 8);
	for (i = 0; i < n; i++)
		scanf("%lld", &s[i]);

	qsort(s, n, 8, cmp);

	short m = 0, hist[10000] = {1};
	long long a[10000];
	a[0] = s[0];
	for (i = 1; i < n; i++) {
		if (s[i] != a[m]) {
			m++;
			a[m] = s[i];
		}
		hist[m]++;
	}
	m++;

	long val = 0;
	long long foo;
	void *p;
	for (i = 0; i < m; i++) {
		foo = b - a[i];
		if (foo == a[i])
			val += hist[i] * (hist[i] - 1) / 2;
		if (foo <= a[i])
			break;
		p = bsearch(&foo, a, m, 8, cmp);
		if (p != NULL)
			val += hist[i] * hist[(long long *) p - a];
	}

	printf("%ld\n", val);

	return 0;
}
