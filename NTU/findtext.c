#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	char *x = malloc(10000000);
	scanf("%s", x);

	long len = strlen(x) / 2 + 1, i, idx = 0;
	char *dup;
	char *s = malloc(len);
	for (i = 1; i < len; i++) {
		s[i - 1] = x[i - 1];
		s[i] = 0;
		dup = strstr(x + i, s);

		if (dup == NULL)
			break;
		else
			idx = dup - x;
	}

	printf("%ld %ld\n", i - 1, idx + 1);
	return 0;
}
