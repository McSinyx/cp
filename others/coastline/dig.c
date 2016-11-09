#include <stdio.h>
#include <string.h>

int main()
{
	char k, n[21], digits[10] = {}, i, avail = 0, j;

	scanf("%hhd %s", &k, n);

	for (i = 0; i < strlen(n); i++)
		digits[n[i] - 48] = 1;

	for (i = 0; i < 10; i++)
		if (!digits[i])
			avail++;

	if (avail == 1 && !digits[0] || !avail || avail > k) {
		putchar(48);
	} else {
		if (!digits[0])
			for (i = 1; i < 10; i++)
				if (!digits[i]) {
					putchar(i + 48);
					digits[i] = 1;
					avail--;
					k--;
					break;
				}

		for (i = 0; i < 10 && k; i++)
			if (!digits[i]) {
				for (j = 0; j <= k - avail; j++)
					putchar(i + 48);
				k = avail - 1;
				digits[i] = 1;
				break;
			}

		for (i = 0; i < 10 && k; i++)
			if (!digits[i]) {
				putchar(i + 48);
				k--;
			}
	}

	putchar(10);

	return 0;
}
