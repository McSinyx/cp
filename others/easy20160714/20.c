#include <stdio.h>
#include <string.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char x[1001], y[1001], r = 0;
	short m, n, i, j = 0, z[1000][128] = {};

	fscanf(f, "%s %s", x, y);
	fclose(f);

	m = strlen(x);
	n = strlen(y);

	for (i = 0; i < n; i++)
		if ((y[i] == x[j]) && (++j == m)) {
			r = 1;
			break;
		}

	f = fopen("OUT.TXT", "w");
	fputs(r ? "YES\n" : "NO\n", f);
	fclose(f);

	return 0;
}
