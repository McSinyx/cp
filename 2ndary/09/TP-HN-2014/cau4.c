#include <stdlib.h>
#include <stdio.h>

int cmp(const void *x, const void *y)
{
	return *(int *) x - *(int *) y;
}

int main()
{
	FILE *f = fopen("CAU4.INP", "r");
	int n, d, k;
	fscanf(f, "%d %d", &n, &d);
	int *a = (int *) malloc(n * sizeof(int));
	for (k = 0; k < n; k++)
		fscanf(f, "%d", a + k);
	k = a[--d];
	fclose(f);

	qsort(a, n, sizeof(int), cmp);
	int t = 0;
	for (int i = 1; i < n; i++)
		t += abs(a[i] - a[i - 1]);
	int idx = (int *) bsearch(&k, a, n, sizeof(int), cmp) - a;
	if ((idx - d) * (idx - n + d + 1)) {
		int t0, t1;
		if (idx < d) {
			t0 = (t - abs(a[n - d + idx] - a[n - d + idx - 1])
			      + abs(a[n - d + idx] - *a));
			d = n - d - 1;
			t1 = (t - abs(a[idx - d] - a[idx - d - 1])
			      + abs(a[n - 1] - a[idx - d - 1]));
		} else {
			t0 = (t - abs(a[idx - d] - a[idx - d - 1])
			      + abs(a[n - 1] - a[idx - d - 1]));
			d = n - d - 1;
			t1 = (t - abs(a[n - d + idx] - a[n - d + idx - 1])
			      + abs(a[n - d + idx] - *a));
		}
		t = (t0 < t1) ? t0 : t1;
	}

	f = fopen("CAU4.OUT", "w");
	fprintf(f, "%d\n", t);
	fclose(f);

	return 0;
}
