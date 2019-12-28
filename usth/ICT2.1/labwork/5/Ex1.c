/*
 * Cocktail shaker sorting integers from stdin
 * Copyright (C) 2019,  Nguyễn Gia Phong
 * This software is licenced under a CC BY-SA 4.0 license
 */

#include <stdio.h>

void strswap(char *this, char *that, size_t n)
{
	while (n--) {
		this[n] ^= that[n];
		that[n] ^= this[n];
		this[n] ^= that[n];
	}
}

void csort(void *base, size_t nmemb, size_t size,
           int (*compar)(const void *, const void *))
{
	char *i, *low = base;
	char *high = low + nmemb * size;
	do {
		char *h = i = low;
		while ((i += size) < high)
			if (compar(i - size, i) > 0)
				strswap(i - size, h = i, size);
		high = h;
		if (low + size >= high)
			break;
		char *l = i = high;
		while ((i -= size) > low)
			if (compar(i - size, i) > 0)
				strswap(i - size, l = i, size);
		low = l;
	} while (low + size < high);
}

int cmp(const void *x, const void *y)
{
	return *(int *) x - *(int *) y;
}

int main()
{
	size_t n;
	scanf("%zu", &n);
	int a[n];
	for (int i = 0; i < n; i++)
		scanf("%d", a + i);

	csort(a, n, sizeof(int), cmp);
	for (int i = 0; i < n; i++)
		printf("%d ", a[i]);
	putchar(10);

	return 0;
}
