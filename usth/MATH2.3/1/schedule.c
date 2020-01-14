#include <stdio.h>
#include <stdlib.h>

struct talk {
	int start, end;
};

int cmp(const void *x, const void *y)
{
	return ((struct talk *) x)->end - ((struct talk *) y)->end;
}

int main()
{
	size_t n;
	scanf("%zu", &n);
	struct talk *a = malloc(n * sizeof(struct talk));
	for (size_t i = 0; i < n; ++i)
		scanf("%d %d", &a[i].start, &a[i].end);

	qsort(a, n, sizeof(struct talk), cmp);
	int start = a->start;
	for (size_t i = 0; i < n; ++i)
		if (a[i].start >= start) {
			printf("%d %d\n", a[i].start, a[i].end);
			start = a[i].end;
		}

	return 0;
}
