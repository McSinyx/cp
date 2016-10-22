#include <stdio.h>
#include <math.h>

int main()
{
	short r;
	long r2;

	scanf("%hd", &r);
	r2 = r * r;

	printf("%.6f\n%ld.000000\n", r2 * M_PI, r2 * 2);

	return 0;
}
