#include <stdio.h>

#define abs(x) (x < 0) ? -x : x

int gcd(int a, int b)
{
	int c;

	while (b) {
		c = a % b;
		a = b;
		b = c;
	}

	return a;
}

int main()
{
	int a, b, c, i, j, k, l, m, n, t;
	char solutions[201][100];

	scanf("%d", &t);
	for (i = t; i; i--) {
		for (k = 0; k < 201; k++)
			for (l = 0; l < 100; l++)
				solutions[k][l] = 0;

		scanf("%d", &n);
		for (j = n; j; j--) {
			scanf("%d %d", &a, &b);
			if (a) {
				c = gcd(a, b);

				if (a * b < 0)
					a = -abs(a / c) + 100;
				else
					a = abs(a / c) + 100;
				b = abs(b / c) - 1;

				solutions[a][b] = 1;
			}
		}

		m = 0;
		for (j = 0; j < 201; j++)
			for (k = 0; k < 100; k++)
				if (solutions[j][k])
					m++;

		printf("%d\n", m);
	}

	return 0;
}
