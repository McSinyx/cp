#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	short x;

	fscanf(f, "%hd", &x);

	fclose(f);

	if (x > -2)
		x = -2;
	else
		do
			x--;
		while (x % 2);

	f = fopen("OUT.TXT", "w");

	fprintf(f, "%hd\n", x);

	fclose(f);

	return 0;
}
