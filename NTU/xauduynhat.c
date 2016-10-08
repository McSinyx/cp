#include <stdio.h>
#include <string.h>
#include <ctype.h>

unsigned short unqlen(char *s)
{
	char up[26] = {}, low[26] = {}, c;
	unsigned short i, len = strlen(s);

	for (i = 0; i < len; i++) {
		c = s[i];
		if (islower(c)) {
			low[c - 97]++;
			if (low[c - 97] > 1)
				return i;
		} else {
			up[c - 65]++;
			if (up[c - 65] > 1)
				return i;
		}
	}

	return i;
}

int main()
{
	char s[50000];
	scanf("%s", s);

	unsigned short i, max = 1, val;

	for (i = 0; i < strlen(s) - max; i++) {
		val = unqlen(s + i);
		if (val > max)
			max = val;
	}

	printf("%hd\n", max);

	return 0;
}
