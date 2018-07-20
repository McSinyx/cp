#include <stdlib.h>
#include <stdio.h>

struct trees {
	long d, a, b;
};

int cmp(const void *x, const void *y)
{
	long d = ((struct trees *) x)->d - ((struct trees *) y)->d;
	if (d < 0)
		return -1;
	else if (d > 0)
		return 1;
	else
		return 0;
}

int main()
{
	FILE *f = fopen("MINROAD.INP", "r");
	long n, a, b;
	fscanf(f, "%ld %ld %ld\n", &n, &a, &b);

	struct trees *t = (struct trees *) malloc(n * sizeof(struct trees));
	long k;
	for (long i = 0; i < n; i++) {
		fscanf(f, "%ld %ld\n", &t[i].d, &k);
		if (k == 1) {
			t[i].a = 1;
			t[i].b = 0;
		} else {
			t[i].a = 0;
			t[i].b = 1;
		}
	}
	fclose(f);

	qsort(t, n, sizeof(struct trees), cmp);
	for (long i = 1; i < n; i++) {
		t[i].a += t[i - 1].a;
		t[i].b += t[i - 1].b;
	}

	struct trees *enough = t;
	for (k = n; k > 0 && (enough->a < a || enough->b < b); k--)
		enough++;

	long d0 = -1, d1, maxa, maxb;
	for (; k--; enough++) {
		maxa = enough->a - a;
		maxb = enough->b - b;
		while (t->a <= maxa && t->b <= maxb) {
			t++;
			n--;
		}

		d1 = d0;
		d0 = enough->d - t->d;
		if (d1 != -1 && d1 < d0)
			d0 = d1;
	}

	f = fopen("MINROAD.OUT", "w");
	fprintf(f, "%ld\n", d0);
	fclose(f);

	return 0;
}
