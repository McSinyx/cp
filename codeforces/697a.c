#include <stdio.h>

int main()
{
	long t, s, x;

	scanf("%ld %ld %ld", &t, &s, &x);

	x -= t;

	if (((x % s == 1) && (x / s > 0)) || ((x % s == 0) && (x / s >= 0)))
		puts("YES");
	else
		puts("NO");

	return 0;
}
