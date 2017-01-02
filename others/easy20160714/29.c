#include <stdio.h>

char divpp(char x, char y)
{
	return (x % y) ? (x / y + 1) : (x / y);
}

float average(int a[10][10], char t, char l, char b, char r)
{
	float s = 0.0;
	char i, j;

	for (i = t; i <= b; i++)
		for (j = l; j <= r; j++)
			s += (float) a[i][j];

	return s / (float) (b - t + 1) / (float) (r - l + 1);
}

int main()
{
	FILE *f = fopen("INP.TXT", "r");
	char m, n, s, i, i0, j, j0, b = 1;
	int a[10][10];
	float r = 0;

	fscanf(f, "%hhd %hhd %d", &m, &n, &s);

	for (i = 0; i < m; i++)
		for (j = 0; j < n; j++)
			fscanf(f, "%d", &a[i][j]);

	fclose(f);

	for (i = 0; i < m; i++)
		for (j = 0; j < n; j++)
			for (i0 = i; i0 < m; i0++)
				for (j0 = j + divpp(s, i0 - i + 1) - 1; j0 < n;
				     j0++)
					if (b || average(a, i, j, i0, j0) > r) {
						r = average(a, i, j, i0, j0);
						b = 0;
					}

	f = fopen("OUT.TXT", "w");
	fprintf(f, "%f\n", r);
	fclose(f);

	return 0;
}
