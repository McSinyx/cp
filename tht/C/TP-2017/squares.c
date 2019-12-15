#include <stdio.h>
#include <stdlib.h>

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

struct poin_t {
	short x, y;
};

int main()
{
	FILE *f = fopen("squares.inp", "r");
	short m, n, i, j, x, y, mini, maxi, minj, maxj, _minj, _maxj;
	char k, c, net[1001][1001] = {};
	long long count = 0;
	struct poin_t *e;

	fscanf(f, "%hd %hd %hhd\n", &m, &n, &k);
	for (i = 1; i < MIN(m, n); i++)
		count += (long long) i * (m - i) * (n - i);
	e = malloc(k * sizeof(struct poin_t));
	for (i = 0; i < k; i++) {
		fscanf(f, "%hd %hd\n", &e[i].x, &e[i].y);
		net[e[i].x][e[i].y] = 1;
	}
	fclose(f);

	for (count *= 12; k--; e++) {
		x = (*e).x;
		y = (*e).y;
		mini = MAX(x - m, 1 - y);
		maxi = MIN(x - 1, n - y);
		_minj = MAX(1 - x, 1 - y);
		_maxj = MIN(m - x, n - y);
		for (i = mini; i <= maxi; i++) {
			minj = MAX(MAX(i - x + 1, 1 - y - i), _minj);
			maxj = MIN(MIN(m - x + i, n - y - i), _maxj);
			for (j = minj; j <= maxj; j++) {
				if (!i && !j)
					continue;
				c = 1;
				if (net[x - i][y + j])
					c++;
				if (net[x + j][y + i])
					c++;
				if (net[x - i + j][y + i + j])
					c++;
				count -= 12 / c;
			}
		}
	}

	f = fopen("squares.out", "w");
	fprintf(f, "%Ld\n", count / 12);
	fclose(f);

	return 0;
}
