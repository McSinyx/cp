#include <stdio.h>
#include <string.h>

int main()
{
	char n, count = 0, s[21], c, i;
	unsigned long long m;

	for (n = 1; n < 20 && scanf("%lld", &m) != EOF; n++) {
		if (m < 10)
			continue;

		sprintf(s, "%lld", m);
		c = s[0];

		for (i = 1; i < strlen(s) && c; i++)
			c = (c > s[i]) ? 0 : s[i];

		if (c)
			count++;
	}

	printf("%hhd\n", count);

	return 0;
}
