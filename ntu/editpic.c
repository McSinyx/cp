#include <stdio.h>

const long long POW2[] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048,
                          4096, 8192, 16384, 32768, 65536, 131072, 262144,
                          524288, 1048576, 2097152, 4194304, 8388608, 16777216,
                          33554432, 67108864, 134217728, 268435456, 536870912};

int main()
{
	long long l, w, l0, w0, l1, w1;
	char i;

	scanf("%lld %lld", &l, &w);

	for (i = 29; POW2[i] > l || POW2[i] * 4 > w * 5; i--);
	l0 = POW2[i];
	w0 = (l0 * 5 >= w * 4) ? w : l0 * 5 / 4;

	for (i = 29; POW2[i] > w || POW2[i] * 4 > l * 5; i--);
	w1 = POW2[i];
	l1 = (w1 * 5 >= l * 4) ? l : w1 * 5 / 4;

	l = l0 * w0 - l1 * w1;
	if (l > 0 || !l && l0 > l1)
		printf("%lld %lld\n", l0, w0);
	else
		printf("%lld %lld\n", l1, w1);

	return 0;
}
