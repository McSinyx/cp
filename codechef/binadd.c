#include <stdio.h>
#include <stdlib.h>

#define SIZE (100001 * sizeof(int))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

int main()
{
	size_t t;
	int *a = malloc(SIZE), *b = malloc(SIZE), c;
	*a = *b = 0;
	scanf("%zu", &t);

	while (t--) {
		size_t lena = 1, lenb = 1;
		for (scanf(" "); (c = getchar()) > 42; a[lena++] = c - 48);
		for (scanf(" "); (c = getchar()) > 42; b[lenb++] = c - 48);

		size_t len = (lena > lenb) ? lena : lenb;
		for (int *n = a + len, *e = a + lena, *p = b + lenb;
		     n-- > a; *n = (e-- > a && *e) << 1 | (p-- > b && *p));

		int tmp = 0;
		size_t result = 0, sum = 0;
		for (int *n = a + len; n-- > a;)
			switch (*n | tmp) {
			case 1:
				result = MAX(result, 1);
				break;
			case 3:
				tmp = 4;
				break;
			case 4:
				result = MAX(result, sum + 2);
				sum = tmp = 0;
				break;
			case 5:
			case 6:
				sum++;
				break;
			case 7:
				if (n[1] < 3) {
					result = MAX(result, sum + 2);
					sum = 0;
				}
			}
		printf("%zu\n", result);
	}

	return 0;
}
