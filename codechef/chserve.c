#include <stdio.h>

int main()
{
	int t;
	long p, q, k;

	scanf("%d\n", &t);
	while (t--) {
		scanf("%ld %ld %ld\n", &p, &q, &k);
		puts(((p + q) / k % 2) ? "COOK" : "CHEF");
	}

	return 0;
}
