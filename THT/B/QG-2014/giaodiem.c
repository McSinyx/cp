#include <stdio.h>

const long long TESTS[] = {4, 7, 10, 11, 7777, 8888888, 1234567890, 9999999999,
                           12345678912345, 2014201420142014};

int main()
{
	char i, j, k, divisor;
	long long n, p;
	FILE *f = fopen("GIAODIEM.TXT", "w");

	for (i = 0; i < 10; i++) {
		divisor = 24;
		p = 1;
		for (j = 0; j < 4; j++) {
			n = TESTS[i] - j;
			for (k = 2; k < 4; k++) {
				while (!(n % k + divisor % k)) {
					n /= k;
					divisor /= k;
				}
			}
			p *= n % 2014;
		}
		fprintf(f, "%d\n", p % 2014);
	}
	fclose(f);
	return 0;
}
