#include <stdio.h>
#include <stdlib.h>
#include <string.h>

short MIN_K, *P;

void putnc(char *s, short len)
{
	short i;

	for (i = 0; i < len; i++)
		putchar(s[i]);
	putchar(10);
}

char palin(char *s, short len)
{
	short i;

	for (i = 0; i < (len + 1) / 2; i++)
		if (s[i] != s[len - i - 1])
			return 0;

	return 1;
}

void foo(char *s, short len, short k, short *p)
{
	short i, j;

	if (palin(s, len)) {
		MIN_K = k;
		memcpy(P, p, k * sizeof(short));
		return;
	}

	if (k >= MIN_K)
		return;

	for (i = len - 1; i; i--)
		if (palin(s, i)) {
			p[k] = p[k - 1] + i;
			foo(s + i, len - i, k + 1, p);
		}
}

int main()
{
	short n, i, *p;
	char *s;

	scanf("%hd\n", &n);
	s = malloc(n + 1);
	fgets(s, n + 1, stdin);

	MIN_K = n;
	P = malloc(n);
	p = malloc(n);
	p[0] = 0;
	foo(s, n, 1, p);

	printf("%hd\n", MIN_K);
	for (i = 1; i < MIN_K; i++)
		putnc(s + P[i - 1], P[i] - P[i - 1]);
	puts(s + P[MIN_K - 1]);

	return 0;
}
