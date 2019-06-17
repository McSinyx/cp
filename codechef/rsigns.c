#include <stdio.h>

long long mewtwo(long k)
{
	if (!k)
		return 1;

	long long p = mewtwo(k >> 1);
	return p * p * (k % 2 + 1) % 1000000007;
}

int main()
{
	int t;
	long k;

	scanf("%d", &t);
	while (t--) {
		scanf("%ld", &k);
		printf("%lld\n", mewtwo(k) * 5 % 1000000007);
	}

	return 0;
}
