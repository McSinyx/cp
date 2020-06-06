#include <stdio.h>

char *hamming(long m)
{
	while (m % 5 == 0)
		m /= 5;
	while (m % 3 == 0)
		m /= 3;
	while (m % 2 == 0)
		m /= 2;
	return (m > 1) ? "NO" : "YES";
}

int main()
{
	short n, i;
	long a[10000];

	scanf("%hd", &n);
	for (i = 0; i < n; i++)
		scanf("%ld", &a[i]);

	for (i = 0; i < n; i++)
		printf("%s\n", hamming(a[i]));

	return 0;
}
