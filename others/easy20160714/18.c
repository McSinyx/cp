#include <ctype.h>
#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char c, prevc = 100;
	unsigned long long x = 0, y = 0;

	while ((c = fgetc(f)) != EOF) {
		if (isdigit(prevc) && !isdigit(c)) {
			y += x;
			x = 0;
		} else if (isdigit(c)) {
			x = x * 10 + c - 48;
		}

		prevc = c;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%lld\n", y);
	fclose(f);

	return 0;
}
