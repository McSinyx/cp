#include <stdio.h>
#include <string.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char x[100001], y[100001];
	long i, m, n, r = -1;

	fscanf(f, "%s %s", x, y);
	fclose(f);

	m = strlen(x);
	n = strlen(y) - m;
	for (i = 0; i < n; i++)
		if (!strncmp(x, y + i, m)) {
			r = i + 1;
			break;
		}

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%ld\n", r);
	fclose(f);

	return 0;
}
