#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int cmp(const void *x, const void *y)
{
	return *(long *) x - *(long *) y;
}

int main()
{
	short i;
	long a[31622]; /* square root of 1 billion */
	for (i = 0; i < 31622; i++) {
		a[i] = i + 1;
		a[i] *= a[i];
	}

	short t;
	scanf("%hd", &t);

	long *n = malloc(t * sizeof(long));
	for (i = 0; i < t; i++)
		scanf("%ld", &n[i]);

	long foo;
	for (i = 0; i < t; i++) {
		foo = (long) sqrt(n[i]);
		foo *= foo;
		foo = (long *) bsearch(&foo, a, 31622, 4, cmp) - a;
		while ((foo > 0) && (n[i] % a[foo]))
			foo--;
		printf("%hd %ld\n", foo + 1, n[i] / a[foo]);
	}

	return 0;
}
