#include <stdio.h>
#include <string.h>

int main()
{
	char b[100], i;
	short a = 0;

	scanf("%s", b);

	for (i = strlen(b) - 1; i >= 0; i -= 2)
		a += b[i] - 48;

	for (i = strlen(b) - 2; i >= 0; i -= 2)
		a += b[i] * 2 - 96;

	printf("%d\n", a % 3);

	return 0;
}
