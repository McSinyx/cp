#include <stdio.h>
#include <math.h>

char get(long m, char idx)
{
	long n10 = (long) pow(10, idx + 1);
	m %= n10;
	if (idx)
		m /= (n10 / 10);
	return m;
}

int main()
{
	short n, i;
	long a[1000];
	scanf("%hd", &n);
	for (i = 0; i < n; i++)
		scanf("%ld", &a[i]);

	char j, len, boo;
	for (i = 0; i < n; i++) {
		boo = 1;
		len = (char) log10(a[i]);
		if (len)
			for (j = 0; j * 2 < len; j++) {
				if (get(a[i], j) != get(a[i], len - j)) {
					boo = 0;
					break;
				}
			}
		if (boo)
			printf("%ld ", a[i]);
	}

	printf("\n");
	return 0;
}
