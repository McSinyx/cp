#include <stdio.h>
#include <math.h>

int main()
{
	long long n, sqrtn;
	long i, tmp;

	scanf("%lld", &n);
	sqrtn = sqrt(n);

	for (i = 2; i <= sqrtn && n > 1; i++)
		while (n % i == 0) {
			n /= i;
			tmp = i;
		}

	printf("%lld\n", (n == 1) ? tmp : n);

	return 0;
}
