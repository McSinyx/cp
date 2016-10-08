#include <stdio.h>

int main()
{
	long n, m, g, c;

	scanf("%ld %ld", &n, &m);

	g = n*2 - m/2;
	c = m/2 - n;

	if ((g + c == n) && (g*2 + c*4 == m) && (g >= 0) && (c >= 0))
		printf("%ld %ld\n", g, c);
	else
		puts("-1");

	return 0;
}
