#include <stdio.h>

int main()
{
	FILE * f = fopen("INP.TXT", "r");
	int n, i, preva, a, r = 1;

	fscanf(f, "%d", &n, &preva);
	for (i = 1; i < n; i++) { 
		fscanf(f, "%d", &a);
		if (a > preva)
			r++;
		preva = a;
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%d\n", r);
	fclose(f);

	return 0;
}
