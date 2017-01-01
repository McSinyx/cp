#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	short n, i, a;
	char b[10000] = {};

	fscanf(f, "%hd", &n);

	for (i = 0; i < n; i++) {
		fscanf(f, "%hd", &a);
		if (a <= n)
			b[a - 1] = 1;
	}

	fclose(f);

	a = 1;
	for (i = 0; i < n; i++)
		if (!b[i]) {
			a = 0;
			break;
		}

	f = fopen("OUT.TXT", "w");
	fputs(a ? "YES\n" : "NO\n", f);
	fclose(f);

	return 0;
}
