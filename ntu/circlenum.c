#include <stdio.h>

const long long INTPOW10[] = {1, 10, 100, 1000, 10000, 100000, 1000000,
                              10000000, 100000000, 1000000000, 10000000000,
                              100000000000, 1000000000000, 10000000000000,
                              100000000000000, 1000000000000000,
                              10000000000000000, 100000000000000000,
                              1000000000000000000};

char intlog10(long long n)
{
	char val = 0;
	while (n > 9) {
		n /= 10;
		val++;
	}

	return val;
}

char isnt_circle(long long n)
{
	return n % 10 != n / INTPOW10[intlog10(n)];
}

int main()
{
	long long l, r;
	scanf("%lld %lld", &l, &r);
	while (isnt_circle(l))
		l++;
	while (isnt_circle(r))
		r--;

	char llog = intlog10(l);
	char rlog = intlog10(r);
	long long l0, r0, val = 0;
	for (char i = llog; i <= rlog; i++) {
		l0 = INTPOW10[i] + 1;
		l0 = (l0 > l) ? l0 : l;
		r0 = INTPOW10[i + 1] - 1;
		r0 = (r0 < r) ? r0 : r;
		r0 -= l0;
		if (r0 >= 0) {
			val++;
			val += (r0 < 10) ? r0 : (r0 / 10);
		}
	}

	printf("%lld\n", val);

	return 0;
}
