#include <stdio.h>

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	unsigned long long n;
	long long a, b, c;
	char s[5] = {89, 69, 83, 10};

	fscanf(f, "%lld", &n);

	if (n > 2) {
		fscanf(f, "%lld %lld", &a, &b);
		c = b - a;

		for (n -= 2; n; n--) {
			a = b;
			fscanf(f, "%lld", &b);

			if (a - b + c) {
				s[0] = 78;
				s[1] = 79;
				s[2] = 10;
				s[3] = 0;

				break;
			}
		}
	}

	fclose(f);

	f = fopen("OUT.TXT", "w");

	fputs(s, f);

	fclose(f);

	return 0;
}
