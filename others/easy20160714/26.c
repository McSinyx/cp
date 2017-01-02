#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int n, k, *a, i;
	long long s = 0;

	fscanf(f, "%d %d", &n, &k);
	a = malloc(n * sizeof(int));

	for (i = 0; i < n; i++) {
		fscanf(f, "%d", a + i);
		s += a[i];
	}

	fclose(f);

	k = s / k;
	s = 0;

	for (i = 0; i < n; i++) {
		s += a[i];

		if (s == k)
			s = 0;
	}

	f = fopen("OUT.TXT", "w");
	fputs(s ? "NO\n" : "YES\n", f);
	fclose(f);

	return 0;
}
