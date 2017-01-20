#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char streq(char *x, char *y)
{
	char i;

	for (i = 0; i < strlen(x); i++)
		if (x[i] != y[i])
			return 0;

	return 1;
}

int main()
{
	FILE *fi = fopen("FIBISTR.INP", "r"), *fo = fopen("FIBISTR.OUT", "w");
	char **fibi = malloc(35 * sizeof(char *)), s[26], n;
	long i, c;

	fibi[0] = malloc(2);
	fibi[1] = malloc(2);
	fibi[0][0] = 65;
	fibi[1][0] = 66;
	fibi[0][1] = fibi[1][1] = 0;

	for (i = 2; i < 35; i++) {
		fibi[i] = malloc(strlen(fibi[i - 1]) + strlen(fibi[i - 2]) + 1);
		strcpy(fibi[i], fibi[i - 1]);
		strcpy(fibi[i] + strlen(fibi[i - 1]), fibi[i - 2]);
	}

	do {
		fscanf(fi, "%hhd %s\n", &n, s);
		n--;
		c = 0;
		for (i = strlen(fibi[n]) - strlen(s); i >= 0; i--)
			c += streq(s, fibi[n] + i);
		fprintf(fo, "%ld\n", c);
	} while (!feof(fi));

	fcloseall();
	return 0;
}
