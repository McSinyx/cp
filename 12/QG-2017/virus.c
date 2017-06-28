#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char T[3001], **mem;

char difflim(char lim, short len, short beg)
{
	char count = 0, *s, *z;
	short i;

	if (mem[len - 1][beg] >= 0)
		return mem[len - 1][beg] <= lim;
	s = T + beg;
	z = s + len;
	for (i = 0; i < len; i++)
		if ((count += s[i] != z[i]) > 10)
			break;
	return (mem[len - 1][beg] = count) <= lim;
}

int main() {
	FILE *f = fopen("VIRUS.INP", "r");
	char i, n, level, *levels;
	short m, j, k, len, lenpos, pos[3000], res[11] = {};

	fscanf(f, "%hhd\n%s\n", &n, T);
	levels = malloc(n);
	for (i = 0; i < n; i++)
		fscanf(f, "%hhd\n", levels + i);
	fclose(f);
	m = strlen(T);

	for (i = 97; i < 123; i++) {
		lenpos = 0;
		for (j = 0; j < m; j++)
			if (T[j] == i)
				pos[lenpos++] = j;

		if (lenpos < 2)
			continue;

		for (j = 0; j < lenpos - 1; j++)
			for (k = lenpos - 1; k > j; k--) {
				len = pos[k] - pos[j];
				if (len <= res[0])
					break;
				if (m - pos[k] < len)
					continue;
				if (!strncmp(T + pos[j], T + pos[k], len)) {
					res[0] = len;
					break;
				}
			}
	}

	mem = malloc(m * sizeof(char *) / 2);
	for (len = 0; len < m / 2; len++) {
		mem[len] = malloc(m - len * 2);
		for (j = 0; j < m - len * 2; j++)
			mem[len][j] = -1;
	}

	for (level = 1; level <= 10; level++) {
		for (i = j = 0; i < n; i++)
			if (levels[i] == level)
				j++;
		if (!j)
			continue;

		if (level * 2 > m) {
			res[level] = m / 2;
			continue;
		}

		res[level] = level;
		for (j = 0; j < level; j++)
			if (res[j] > res[level])
				res[level] = res[j];

		for (len = m / 2; len > res[level]; len--)
			for (j = 0; j <= m - len * 2; j++)
				if (difflim(level, len, j)) {
					res[level] = len;
					break;
				}
	}

	f = fopen("VIRUS.OUT", "w");
	for (i = 0; i < n; i++)
		fprintf(f, "%hd\n", res[levels[i]]);
	fclose(f);
	return 0;
}
