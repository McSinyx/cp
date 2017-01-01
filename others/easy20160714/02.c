#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char n;
	short a, tmp = -1;

	fscanf(f, "%hhd", &n);

	for (; n; n--) {
		fscanf(f, "%hd", &a);
		tmp = (a > tmp && a % 2 == 0) ? a : tmp;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");

	fprintf(f, "%hd\n", tmp);

	fclose(f);

	return 0;
}
