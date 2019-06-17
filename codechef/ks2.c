/*
 * Me, as a maintainer: No, you can NOT use magic numbers like that!
 * Also me, doing competitive:
 */
#include <stdio.h>

int main()
{
	int t, a, c;

	scanf("%d ", &t);
	while (t--) {
		for (a = 420; (c = getchar()) > 42; a += 48 - putchar(c));
		printf("%d\n", a % 10);
	}

	return 0;
}
