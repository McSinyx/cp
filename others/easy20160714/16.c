#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>

int main()
{
	FILE *fi = fopen("INP.TXT", "r"), *fo = fopen("OUT.TXT", "w");
	unsigned char n, i, j, s[256], sx[256], x, y;

	fscanf(fi, "%s %hhd\n", s, &n);

	for (i = 0; i < n; i++)
		if (fgetc(fi) ^ 49) {
			fscanf(fi, " %hhd %hhd\n", &x, &y);
			x--;
			memmove(s + x, s + x + y, strlen(s) - x - y + 1);
			fprintf(fo, "%s\n", s);
		} else {
			fscanf(fi, " %s %hhd\n", sx, &y);
			strcpy(sx + strlen(sx), s + y);
			strcpy(s + y, sx);
			fprintf(fo, "%s\n", s);
		}

	fcloseall();

	return 0;
}
