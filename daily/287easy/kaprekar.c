#include <stdio.h>

char a[4];

char largest_digit(short n) 
{
	char m = n / 1000;

	if (m < n % 1000 / 100)
		m = n % 1000 / 100;

	if (m < n % 100 / 10)
		m = n % 100 / 10;

	return (m < n % 10) ? n % 10 : m;
}

void sort_digits(short n)
{
	char i, j;

	a[0] = n / 1000;
	a[1] = n % 1000 / 100;
	a[2] = n % 100 / 10;
	a[3] = n % 10;

	for (i = 0; i < 3; i++)
		for (j = i + 1; j < 4; j++)
			if (a[i] < a[j]) {
				a[i] += a[j];
				a[j] = a[i] - a[j];
				a[i] -= a[j];
			}
}

short desc_digits(short n)
{
	sort_digits(n);

	return a[0] * 1000 + a[1] * 100 + a[2] * 10 + a[3];
}

short asc_digits(short n)
{
	sort_digits(n);

	return a[3] * 1000 + a[2] * 100 + a[1] * 10 + a[0];
}

unsigned long long kaprekar(short n)
{
	char i;

	for (i = 0; n ^ 6174; i++)
		n = desc_digits(n) - asc_digits(n);

	return i;
}

int main()
{
	printf("largest_digit(1234) -> %hhd\n", largest_digit(1234));
	printf("largest_digit(3253) -> %hhd\n", largest_digit(3253));
	printf("largest_digit(9800) -> %hhd\n", largest_digit(9800));
	printf("largest_digit(3333) -> %hhd\n", largest_digit(3333));
	printf("largest_digit(120) -> %hhd\n\n", largest_digit(120));

	printf("desc_digits(1234) -> %hd\n", desc_digits(1234));
	printf("desc_digits(3253) -> %hd\n", desc_digits(3253));
	printf("desc_digits(9800) -> %hd\n", desc_digits(9800));
	printf("desc_digits(3333) -> %hd\n", desc_digits(3333));
	printf("desc_digits(120) -> %hd\n\n", desc_digits(120));

	printf("kaprekar(6589) -> %lld\n", kaprekar(6589));
	printf("kaprekar(5455) -> %lld\n", kaprekar(5455));
	printf("kaprekar(6174) -> %lld\n", kaprekar(6174));

	return 0;
}
