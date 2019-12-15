#include <stdio.h>
#include <string.h>

int main()
{
	char m[256], i;
	scanf("%s", m);

	short n = -(strlen(m) * 48);
	for (i = 0; i < strlen(m); i++)
		n += m[i];

	printf("%hd\n", n);

	return 0;
}
