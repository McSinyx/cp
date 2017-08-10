#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char DIGITS[] = "0123456789ABCDEF";

int cmp(const void *x, const void *y)
{
	return *(char *) x - *(char *) y;
}

char idx(char *c)
{
	return (char *) bsearch(c, DIGITS, 16, sizeof(char), cmp) - DIGITS;
}

int main()
{
	FILE *f = fopen("DIGIT.INP", "r");
	char i, x[1], m[128];
	long l, j;
	unsigned long long *em, *k, *tmp, s[16];

	em = calloc(16, sizeof(unsigned long long));
	k = calloc(16, sizeof(unsigned long long));
	fscanf(f, "%s\n%ld\n%c", m, &l, x);
	fclose(f);

	for (i = 0; i < strlen(m); em[idx(m + i++)]++);
	memcpy(s, em, sizeof(unsigned long long) << 4);

	for (j = 1; j < l; j++) {
		for (i = 0; i < 16; i++)
			if (em[i]) {
				k[i]++;
				do {
					k[em[i] & 15]++;
					em[i] >>= 4;
				} while (em[i]);
			}
		tmp = k;
		k = em;
		em = tmp;
		for (i = 0; i < 16; i++)
			s[i] += em[i];
		puts("");
	}

	if (l)
		for (i = 0; i < 16; i++)
			if (em[i]) {
				s[i]++;
				do {
					s[em[i] & 15]++;
					em[i] >>= 4;
				} while (em[i]);
			}

	f = fopen("DIGIT.OUT", "w");
	fprintf(f, "%Ld\n", s[idx(x)]);
	fclose(f);

	return 0;
}
