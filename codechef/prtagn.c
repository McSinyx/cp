#include <stdio.h>
#include <stdlib.h>

int prt(long n)
{
	int tmp;
	for (tmp = n & 1; n >>= 1; tmp ^= n & 1);
	return tmp;
}

int main()
{
	char t;
	long q, x, z, *s = malloc(sizeof(long) << 17);

	scanf("%hhd", &t);
	while (t--) {
		char *in = calloc(1 << 17, sizeof(char));
		long e = 0, o = 0, *p = s;

		scanf("%ld", &q);
		while (q--) {
			scanf("%ld", &x);
			if (in[x]) {
				printf("%ld %ld\n", e, o);
				continue;
			}

			long *y = p;
			while (y-- > s)
				if ((z = x ^ *y) && !in[z]) {
					*p++ = z;
					in[z] = 1;
					prt(z) ? o++ : e++;
				}

			*p++ = x;
			in[x] = 1;
			prt(x) ? o++ : e++;
			printf("%ld %ld\n", e, o);
		}

		free(in);
	}

	return 0;
}
