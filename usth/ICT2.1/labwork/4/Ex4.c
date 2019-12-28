/*
 * Exchange money from stdin to least number of 1, 2, 5, 10, 20 and 50 bills.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>

struct change {
	unsigned amount, bill;
};

const unsigned BILLS[] = {50, 20, 10, 5, 2, 1, 0};

void print_exchange(unsigned money, const unsigned *bills)
{
	if (!*bills)
		return;
	if (*bills > money) {
		print_exchange(money, bills + 1);
		return;
	}
	printf("%u %u\n", money / *bills, *bills);
	print_exchange(money % *bills, bills + 1);
}

int main()
{
	unsigned n;

	scanf("%u", &n);
	print_exchange(n, BILLS);

	return 0;
}
