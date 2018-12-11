#include <stdio.h>

/* For the sake of performance */
long a[50000], b[50000];

void longxor(long n)
{
	long i, all = 0, almost = 0, vacancy = 0;

	for (i = 0; i < n; i++) {
		printf("1 %ld %ld %ld\n",
		       i + 1, (i + 1) % n + 1, (i + 2) % n + 1);
		fflush(stdout);
		scanf("%ld", b + i);
		all ^= b[i];
	}

	for (i = 2 - n % 3; i < n; i += 3)
		almost ^= b[i];

	for (i = 0; i < n; i++) {
		a[vacancy] = all ^ almost;
		all ^= b[vacancy] ^ b[(vacancy + 1) % n];
		vacancy = (vacancy + 3) % n;
	}
}

void fourxor(long n)
{
	printf("1 %ld %ld %ld\n", n - 2, n - 1, n);
	fflush(stdout);
	scanf("%ld", b);
	printf("1 %ld %ld %ld\n", n - 3, n - 1, n);
	fflush(stdout);
	scanf("%ld", b + 1);
	printf("1 %ld %ld %ld\n", n - 3, n - 2, n);
	fflush(stdout);
	scanf("%ld", b + 2);
	printf("1 %ld %ld %ld\n", n - 3, n - 2, n - 1);
	fflush(stdout);
	scanf("%ld", b + 3);

	long all = b[0] ^ b[1] ^ b[2] ^ b[3];
	a[n - 4] = all ^ b[0];
	a[n - 3] = all ^ b[1];
	a[n - 2] = all ^ b[2];
	a[n - 1] = all ^ b[3];
}

int main()
{
	long t, n, i = 1;

	scanf("%ld", &t);
	while (t-- && i == 1) {
		scanf("%ld", &n);
		if (n % 3) {
			longxor(n);
		} else {
			longxor(n - 4);
			fourxor(n);
		}

		putchar(50);
		for (i = 0; i < n; i++)
			printf(" %ld", a[i]);
		putchar(10);
		fflush(stdout);

		scanf("%ld", &i);
	}

	return 0;
}
