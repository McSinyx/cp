/* Read a natural number from stdin and print its divisors to stdout */
#include <stdio.h>

/* Print all divisors of the given natural number n. */
void print_divisors(int n, int i)
{
	if (i * i == n)
		printf("%d\n", i);		/* Θ(1) */
	if (i * i >= n)
		return;				/* Θ(1) */
	if (n % i == 0)
		printf("%d\n%d\n", i, n / i);	/* Θ(1) */
	print_divisors(n, i + 1);
}

/*
 * Complexity analysis:
 * Let T(n, i) be the time complexity of print_divisors, it is obvious that
 *     T(n, i) = Θ(1) if i*i >= n
 *     T(n, i) = T(n, i + 1) + Θ(1)
 * Thus T(n, 1) = sum(Θ(1) for i from 1 to ceil(sqrt(n))) = Θ(sqrt(n))
 * or the overall time complexity of the call from main is Θ(sqrt(n))
 * on all scenarios.
 */
int main()
{
	int n;

	scanf("%d", &n);
	print_divisors(n, 1);

	return 0;
}
