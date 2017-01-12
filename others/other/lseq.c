#include <stdio.h>
#include <stdlib.h>

int sign(long x)
{
	return (x) ? ((x > 0) ? 1 : -1) : x;
}

int cmp(const void *x, const void *y)
{
	return sign(*(long *) x - *(long *) y);
}

int main()
{
	FILE *f = fopen("LSEQ.INP", "r");
	long n, *a, i, *start, *end, length = 1, tmp;
	char b = 0;

	fscanf(f, "%ld", &n);
	a = malloc(n * sizeof(long));
	for(i = 0; i < n; i++)
		fscanf(f, "%ld", a + i);
	fclose(f);

	qsort(a, n, sizeof(long), cmp);
	start = malloc(n * sizeof(long));
	start[0] = !*a;
	for (i = start[0] + 1; i < n; i++)
		if (a[i] - 1 - a[i - 1])
			start[length++] = i;
	start = realloc(start, length * sizeof(long));

	end = malloc(length * sizeof(long));
	end[length - 1] = n - 1;
	for (i = 1; i < length; i++)
		end[i - 1] = start[i] - 1;

	n = 0;
	if (*a)
		for (i = 0; i < length; i++) {
			tmp = end[i] - start[i] + 1;
			n = (tmp > n) ? tmp : n;
		}
	else
		for (i = 0; i < length; i++) {
			tmp = end[i] - start[i - 1] + 1;
			if (!i || a[end[i]] - a[start[i - 1]] - tmp)
				tmp += start[i - 1] - start[i];
			n = (++tmp > n) ? tmp : n;
		}

	f = fopen("LSEQ.OUT", "w");
	fprintf(f, "%ld\n", n);
	fclose(f);

	return 0;
}
