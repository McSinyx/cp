#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	int n, k, *a, i, r = 1;

	fscanf(f, "%d %d", &n, &k);
	a = malloc(n * sizeof(int));

	for (i = 0; i < n; i++)
		fscanf(f, "%d", a + i);

	fclose(f);

	k = n / k;
	for (i = k; i < n; i += k)
		if (memcmp(a, a + i, k * sizeof(int))) {
			r = 0;
			break;
		}

	f = fopen("OUT.TXT", "w");
	fputs(r ? "YES\n" : "NO\n", f);
	fclose(f);

	return 0;
}
