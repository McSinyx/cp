#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *f = fopen("quacau.inp", "r");
	long n, m, i;
	long long k, *ways;
	char *broken;

	fscanf(f, "%ld %ld %Ld", &n, &m, &k);
	broken = calloc(n + 1, sizeof(char));
	for (; k; k--) {
		fscanf(f, "%ld", &i);
		broken[i] = 1;
	}
	fclose(f);

	ways = (long long *) calloc(n + m + 1, sizeof(long long)) + m;
	*ways = 1;
	for (i = 0; i < n; i++) {
		k = (ways[i] + k - ways[i - m] + 1000000007) % 1000000007;
		if (!broken[i + 1])
			ways[i + 1] = k;
	}

	f = fopen("quacau.out", "w");
	fprintf(f, "%Ld\n", ways[n]);
	fclose(f);
	return 0;
}
