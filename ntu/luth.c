#include <stdio.h>


short pow4(short x, long long n)
{
	if (n == 1)
		return x;

	long y = pow4(x, n / 2);
	y = y * y % 10000;

	if (n % 2)
		return y * x % 10000;
	else
		return y % 10000;
}


int main()
{
	short x;
	long long n;

	scanf("%hd %lld", &x, &n);

	printf("%hd\n", pow4(x, n));

	return 0;
}
