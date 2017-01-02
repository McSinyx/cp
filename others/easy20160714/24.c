#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int n, k, a, i, b = 0, r = 1;

	fscanf(f, "%d %d", &n, &k);

	for (i = 0; i < n; i++) {
		fscanf(f, "%d", &a);
		if (a + b > k) {
			b = 0;
			r++;
		}
		b += a;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%d\n", r);
	fclose(f);

	return 0;
}
