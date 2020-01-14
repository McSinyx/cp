#include <stdio.h>

int main() {
	int n;
	scanf("%d", &n);

	int F[n], f[n][2];
	for (int i = 0; i < n; ++i)
		scanf("%d %d %d", F + i, f[i], f[i] + 1);

	int m;
	scanf("%d ", &m);

	char c[m + 1];
	scanf("%s", c);

	int state = 0;
	for (int i = 0; i < m; ++i)
		state = f[state][c[i] - 48];

	puts(F[state] ? "yes" : "no");

	return 0;
}
