#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char a;
	short n, m;

	fscanf(f, "%hd", &n);

	m = n / 2;

	for (; n; n--) {
		fscanf(f, "%hhd", &a);
		if (a == 1)
			m--;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");

	fputs((m < 0) ? "YES\n" : "NO\n", f);

	fclose(f);

	return 0;
}
