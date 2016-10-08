#include <stdio.h>

int main()
{
	short n;

	scanf("%hd", &n);

	printf("%d\n", n/5 + n/25 + n/125 + n/625);

	return 0;
}
