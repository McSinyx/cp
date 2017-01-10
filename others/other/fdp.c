#include <math.h>
#include <stdio.h>

int main()
{
	FILE *F = fopen("FDP.INP", "r");
	long long n, m, j, factors[11];
	long i;
	char f = 0, fm[11] = {}, fn[11] = {}, k = 127;

	fscanf(F, "%lld %lld", &n, &m);
	fclose(F);

	if (m % 2 == 0) {
		factors[0] = 2;
		do {
			m /= 2;
			fm[0]++;
		} while (m % 2 == 0);
		f = 1;
	}

	for (i = 3; i <= (long) sqrt((double) m); i += 2)
		if (m % i == 0) {
			factors[f] = i;
			do {
				m /= i;
				fm[f]++;
			} while (m % i == 0);
			f++;
		}

	if (m != 1) {
		factors[f] = m;
		fm[f] = 1;
		f++;
	}

	for (i = 0; i < f; i++) {
		for (j = factors[i]; j <= n; j *= factors[i])
			fn[i] += n / j;
		k = (fn[i] / fm[i] < k) ? (fn[i] / fm[i]) : k;
	}

	F = fopen("FDP.OUT", "w");
	fprintf(F, "%hhd\n", k);
	fclose(F);

	return 0;
}
