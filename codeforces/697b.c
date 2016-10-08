#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main()
{
	char a, d[100], b, i, bgun = 0;

	scanf("%hhd.%s", &a, d);
	for (i = 0; i < strlen(d); i++)
		if (d[i] == 101) {
			b = atoi(d + i + 1);
			d[i] = 0;
		}

	if (a) {
		printf("%hhd", a);
		bgun = 1;
	}

	for (i = 0; i < b; i++) {
		a = (i < strlen(d)) ? d[i] : 48;
		if (bgun || a ^ 48) {
			putchar(a);
			bgun = 1;
		}
	}
	
	if (!bgun)
		putchar(48);

	if (i < strlen(d) && (d[i] ^ 48 || strlen(d) ^ 1)) {
		putchar(46);
		for (; i < strlen(d); i++)
			putchar(d[i]);
	}

	putchar(10);

	return 0;
}
