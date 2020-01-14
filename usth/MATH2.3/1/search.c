#include <stdio.h>

void *lsearch(const void *key, const void *base,
              size_t nmemb, size_t size,
              int (*compar)(const void *, const void *))
{
	for (const char *p = base; nmemb--;)
		if (compar(key, p))
			p += size;
		else
			return (void *) p;
	return NULL;
}

void *binary_search(const void *key, const void *base,
                    int lo, int hi, size_t size,
                    int (*compar)(const void *, const void *))
{
	if (lo > hi)
		return NULL;

	int mid = (lo + hi) >> 1;
	int c = compar(key, (char *) base + mid * size);
	if (c > 0)
		return binary_search(key, base, mid + 1, hi, size, compar);
	if (c < 0)
		return binary_search(key, base, lo, mid - 1, size, compar);
	return (char *) base + mid * size;
}

void *bsearch(const void *key, const void *base,
              size_t nmemb, size_t size,
              int (*compar)(const void *, const void *))
{
	return binary_search(key, base, 0, nmemb, size, compar);
}

int cmp(const void *x, const void *y)
{
	return *(int *) x - *(int *) y;
}

int main()
{
	int a[] = {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 88};
	int *l = lsearch(a + 7, a, sizeof(a) / sizeof(int), sizeof(int), cmp);
	int *b = bsearch(a + 7, a, sizeof(a) / sizeof(int), sizeof(int), cmp);
	printf("%zu %zu\n", l - a, b - a);
	return 0;
}
