#include <stdio.h>

char angle(long x, long y, long z)
{
	long long tmp = x * x + y * y - z * z;

	return (tmp ? (tmp > 0 ? 1 : 2) : tmp);
}

int main()
{
	long a, b, c;

	scanf("%ld %ld %ld", &a, &b, &c);

	printf("%hhd\n", angle(a, b, c) * angle(b, c, a) * angle(c, a, b));

	return 0;
}
