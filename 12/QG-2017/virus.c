#include <stdio.h>
#include <string.h>

char difflim(char lim, char *s, short len)
{
	char i, count = 0;

	for (i = 0; i < len; i++)
		if (s[i] != s[len + i] && ++count > lim)
			return 0;
	return 1;
}

int main() {
	FILE *f = fopen("VIRUS.INP", "r");
	char i, n, level, T[3001], levels[10];
	short m, j, k, len, lenpos, pos[3000], res[11] = {};

	fscanf(f, "%hhd\n%s\n", &n, T);
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

	f = fopen("VIRUS.OUT", "w");
	for (i = 0; i < n; i++) {
		level = levels[i];
		if (level && !res[level]) {
			if (level * 2 > m)
				res[level] = m / 2;
			else
				res[level] = level;
			for (j = 0; j < level; j++)
				if (res[j] > res[level])
					res[level] = res[j];

			for (len = m / 2; len > res[level]; len--)
				for (j = 0; j <= m - len * 2; j++)
					if (difflim(level, T + j, len)) {
						res[level] = len;
						break;
					}
		}
		fprintf(f, "%hd\n", res[level]);
	}
	fclose(f);
	return 0;
}
