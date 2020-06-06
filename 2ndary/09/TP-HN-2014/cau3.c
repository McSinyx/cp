#include <stdio.h>
#include <string.h>

char ispalin(char *s, unsigned char len)
{
	unsigned char i, j;
	for (i = 0; i < (len + 1) / 2; i++)
		if (s[i] != s[len - i - 1])
			return 0;
	return 1;
}

unsigned char maxpalin(char s[256])
{
	unsigned char i, j, k, len = strlen(s);
	for (i = len - 1; i; i--)
		for (j = 0; j + i <= len; j++)
			if (ispalin(s + j, i))
				return i;
}

int main()
{
	FILE *f = fopen("CAU3.INP", "r");
	char s[256];
	fscanf(f, "%s\n", s);
	fclose(f);

	unsigned char i, count[128] = {};
	for (i = 0; i < strlen(s); count[s[i++]]++);
	for (i = 1; i < 128; i++)
		if (count[i])
			(*count)++;

	f = fopen("CAU3.OUT", "w");
	fprintf(f, "%hhd\n%hhd\n", *count, maxpalin(s));
	fclose(f);

	return 0;
}
