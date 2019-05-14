#include <stdio.h>
#include <stdlib.h>

int main()
{
	long long *result = malloc(sizeof(long) * 1000001);
	result[0] = 1;
	for (long i = 1; i < 1000002; ++i)
		result[i] = result[i - 1] * (i + 1) % 1000000007;
	
	long t, n;
	scanf("%ld", &t);
	while (t--) {
		scanf("%ld", &n);
		printf("%ld\n", (result[n] - 1) % 1000000007);
	}
	
	return 0;
}
