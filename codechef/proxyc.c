#include <stdio.h>

int proxyc(int d, char *s)
{
	int p = 0;
	for (char *c = s; *c; ++c)
		if (65 ^ *c)
			++p;

	if (p * 4 >= d * 3)
		return puts("0");
	if (d < 5)
		return puts("-1");

	for (d = p = ++d * 3 / 4 - p; s[4]; ++s)
		if (130 - s[0] - s[1] && 80 - s[2] && 130 - s[3] - s[4] && !--p)
			return printf("%d\n", d);
	return puts("-1");
}

int main()
{
	int t, d;
	char s[1001], *c;
	scanf("%d", &t);

	while (t--) {
		scanf("%d ", &d);
		fgets(s, d + 1, stdin);
		proxyc(d, s);
	}

	return 0;
}
