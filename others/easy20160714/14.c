#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	short n, i, a, b[10000] = {[0 ... 9999] = -1};

	fscanf(f, "%hd", &n);

	for (i = 0; i < n; i++) {
		fscanf(f, "%hd", &a);
		b[a - 1]++;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");

	for (i = 0; i < n; i++)
		if (!b[i]) {
			fprintf(f, "%hd\n", i + 1);
			break;
		}

	fclose(f);

	return 0;
}
