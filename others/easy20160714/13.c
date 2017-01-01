#include <stdio.h>

int main()
{
	FILE *fi = fopen("INP.TXT", "r"), *fo = fopen("OUT.TXT", "w");
	short n, i, a, b[10000] = {};
	char m;

	fscanf(fi, "%hd %hhd", &n, &m);

	for (i = 0; i < n; i++) {
		fscanf(fi, "%hd", &a);
		fprintf(fo, "%hd ", ++b[a - 1]);
	}

	fputc(10, fo);

	fcloseall();

	return 0;
}
