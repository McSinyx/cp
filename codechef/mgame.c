#include <stdio.h>
#define sqr(x) ((x) * (x))

int main() {
	long long t, n, p, diff, u, v;
	scanf("%lld", &t);
	while(t--) {
		scanf("%lld %lld", &n, &p);
		if (n < 3) {
			printf("%lld\n", p * p * p);
			continue;
		}

		diff = p - n;
		if (diff % 2) {
			u = n / 2, v = diff/2;
			printf("%lld\n", (u+v*3+2)*(u+v*3+3) + v*(v+1)*3 + 1);
		} else {
			printf("%lld\n", sqr(p/2 + diff + 1) + sqr(diff)*3/4);
		}
	}
	return 0;
}
