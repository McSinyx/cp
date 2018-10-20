#include <stdlib.h>
#include <stdio.h>

int cmp(const void *x, const void *y)
{
	long tmp = *(long *) y - *(long *) x;
	return tmp ? tmp / labs(tmp) : tmp;
}

int main()
{
	int t, k, n, i;
	long *s = malloc(10000 * sizeof(long));
	scanf("%d\n", &t);

	while (t--) {
		scanf("%d %d\n", &n, &k);
		for (i = 0; i < n; i++)
			scanf("%ld", s + i);
		qsort(s, n, sizeof(long), cmp);
		for (i = k; i < n && s[k - 1] == s[i]; i++);
		printf("%d\n", i);
	}

	return 0;
}
