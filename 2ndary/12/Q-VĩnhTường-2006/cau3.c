#include <stdio.h>
#include <math.h>

const char PRIMES[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31};

int main()
{
	char i;
	short n, n0;

	scanf("%hd", &n);

	if (n < 2) {
		printf("\n%hd\n", n);

		return 0;
	}

	n0 = n;

	for (i = 0; i < 11; i++)
		while (n0 % PRIMES[i] == 0) {
			n0 /= PRIMES[i];
			printf("%hd ", PRIMES[i]);
		}

	if (n0 - 1)
		printf("%hd\n", n0);
	else
		putchar(10);

	n0 = pow(2, (int) log2(n) - 1);

	if (n0 * 3 > n)
		printf("%hd\n", n0 * 2);
	else
		printf("%hd %hd\n", n0 * 2, n0 * 3);

	return 0;
}
