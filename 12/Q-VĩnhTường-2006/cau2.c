#include <stdio.h>
#include <math.h>

char prime(unsigned long long m)
{
	unsigned long i;

	for (i = 3; i <= sqrt(m); i += 2)
		if (m % i == 0)
			return 0;

	return 1;
}

int main()
{
	unsigned long long n, i;

	scanf("%lld", &n);

	if (n == 1) {
		puts("2");

		return 0;
	}

	i = (n % 2) ? n : n - 1;

	while (i <= 18446744073709551615ULL) {
		i += 2;

		if (!prime(i))
			continue;

		printf("%lld\n", i);

		return 0;
	}
}
