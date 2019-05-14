#include <stdio.h>
#define MAX(x, y) (((n) > (m)) ? (n) : (m))
#define MIN(x, y) (((n) > (m)) ? (m) : (n))

int match(long long x, long long y, int ari)
{
	long long mod = x % y;
	return (mod && x - y == mod) ? match(y, mod, !ari) : ari;
}

int main()
{
	int t;
	long long n, m;

	scanf("%d", &t);
	while (t--) {
		scanf("%lld %lld", &n, &m);
		puts(match(MAX(n, m), MIN(n, m), 1) ? "Ari" : "Rich");
	}

	return 0;
}
