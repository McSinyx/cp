#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int n, m, l, r, t, b;

	fscanf(f, "%d", &n);

	fscanf(f, "%d", &m);
	l = r = m;
	fscanf(f, "%d", &m);
	t = b = m;

	for (n--; n; n--) {
		fscanf(f, "%d", &m);
		l = (m < l) ? m : l;
		r = (m > r) ? m : r;

		fscanf(f, "%d", &m);
		t = (m < t) ? m : t;
		b = (m > b) ? m : b;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%d\n", (r - l > b - t) ? r - l : b - t);
	fclose(f);

	return 0;
}
