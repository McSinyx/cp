#define _GNU_SOURCE
#include <ctype.h>
#include <stdio.h>

int main()
{
	FILE *fi = fopen("INP.TXT", "r"), *fo = fopen("OUT.TXT", "w");
	char c, prevc = 32;

	while ((c = fgetc(fi)) != EOF) {
		if (prevc ^ 32)
			fputc(isupper(c) ? c + 32 : c, fo);
		else if (c ^ 32)
			fputc(islower(c)) ? c - 32 : c, fo);
		prevc = c;
	}

	fcloseall();

	return 0;
}
