#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

int *rand_array(size_t nmemb)
{
	int *base = malloc(nmemb * sizeof(int));
	for (size_t i = 0; i < nmemb; ++i)
		base[i] = rand() % (1 << nmemb);
	return base;
}

size_t bits(size_t n)
{
	size_t h = 0;
	while (n) {
		n >>= 1;
		h++;
	}
	return h;
}

void *tree(int *base, size_t *nmemb)
{
	size_t n = 1 << bits(*nmemb - 1);
	if ((base = realloc(base, n * sizeof(int) << 1)) == NULL)
		return NULL;
	memcpy(base + n, base, *nmemb * sizeof(int));
	int max = *base;
	for (size_t i = 1; i < *nmemb; ++i)
		max = MAX(base[n + i], max);
	for (size_t i = *nmemb; i < n; ++i)
		base[n + i] = max;
	for (size_t i = n; --i;)
		base[i] = MIN(base[i << 1], base[(i << 1) + 1]);
	*nmemb = n << 1;
	return base;
}

void display(int *base, size_t nmemb, size_t node, size_t indent)
{
	if (node < 1 || node >= nmemb)
		return;
	display(base, nmemb, node << 1, indent + 1);
	for (size_t i = 0; i++ < indent; putchar(9));
	printf("%d", base[node]);
	putchar(10);
	display(base, nmemb, (node << 1) + 1, indent + 1);
}

size_t search(int value, int *base, size_t nmemb, size_t pos)
{
	if (pos < 1 || pos >= nmemb || base[pos] > value)
		return 0;
	if (base[pos] == value)
		return pos;
	size_t left = search(value, base, nmemb, pos << 1);
	return left ? left : search(value, base, nmemb, (pos << 1) + 1);
}

void treeify(int *base, size_t nmemb, size_t node)
{
	if (node > 1 && node < nmemb && base[node >> 1] > base[node]) {
		base[node >> 1] = base[node];
		treeify(base, nmemb, node >> 1);
	}
}

void insert(int value, size_t pos, int *base, size_t nmemb)
{
	if (pos >= nmemb >> 1 && pos < nmemb) {
		base[pos] = value;
		treeify(base, nmemb, pos);
	}
}

void delete(size_t pos, int *base, size_t nmemb)
{
	if (pos > 1 && pos < nmemb) {
		base[pos] = base[pos >> 1];
		delete(pos << 1, base, nmemb);
		delete((pos << 1) + 1, base, nmemb);
	}
}

int main()
{
	size_t n;
	puts("Array length:");
	scanf("%zu", &n);

	srand(time(NULL));
	int *a = rand_array(n);
	a = tree(a, &n);
	display(a, n, 1, 0);

	int x;
	puts("Value to search for:");
	scanf("%d", &x);
	size_t i = search(x, a, n, 1);
	if (i)
		display(a, n, i, 0);
	else
		puts("Not found");

	puts("Value to insert:");
	scanf("%d", &x);
	puts("Leaf index to insert to:");
	scanf("%zu", &i);
	insert(x, i, a, n);
	display(a, n, 1, 0);

	puts("Node to be deleted:");
	scanf("%zu", &i);
	delete(i, a, n);
	display(a, n, 1, 0);

	return 0;
}
