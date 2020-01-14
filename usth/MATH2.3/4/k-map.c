#include <stdio.h>

int main()
{
	int x, y, z, f[8];

	for (int i = 0; i < 8; ++i) {
		scanf("%d %d %d", &x, &y, &z);
		scanf("%d", f + x + (y << 1) + (z << 2));
	}

	printf("\t00\t01\t10\t11\n0\t%d\t%d\t%d\t%d\n0\t%d\t%d\t%d\t%d\n",
	       f[0], f[1], f[2], f[3], f[4], f[5], f[6], f[7]);

	return 0;
}
