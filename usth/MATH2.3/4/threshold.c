#include <stdio.h>
#include <stdlib.h>

int main()
{
	size_t n;
	scanf("%zu", &n);

	double t, *weights = malloc(n * sizeof(double));
	scanf("%lf", &t);
	for (size_t i = 0; i < n; ++i)
		scanf("%lf", weights + i);

	int tmp;
	for (size_t i = 0; i < n; ++i) {
		scanf("%d", &tmp);
		t -= tmp && weights[i];
	}

	putchar((t <= 0) + 48);
	putchar(10);
	return 0;
}
