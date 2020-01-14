#include <stdio.h>

int main()
{
	int pennies;
	scanf("%d", &pennies);
	int quarters = pennies / 25;
	pennies %= 25;
	int dimes = pennies / 10;
	pennies %= 10;
	int nickels = pennies / 5;
	pennies %= 5;

	printf("%d quarters, %d dimes, %d nickels and %d pennies\n",
	       quarters, dimes, nickels, pennies);
	return 0;
}
