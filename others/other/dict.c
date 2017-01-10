#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cmpstr(const void *s1, const void *s2)
{
	return strcmp((char *) s1, (char *) s2);
}

short bistr(char (*a)[21], char *x, short hi)
{
	short lo = 0, mid;

	while (lo < hi) {
		mid = (lo + hi) / 2;
		if (strcmp(a[mid], x) < 0)
			lo = mid + 1;
		else
			hi = mid;
	}

	return lo;
}

int main()
{
	FILE *fi = fopen("dict.inp", "r"), *fo = fopen("dict.out", "w");
	short n, q, i, idx, count;
	char (*words)[21], s[21];

	fscanf(fi, "%hd", &n);

	words = malloc(n * 21);
	for (i = 0; i < n; i++)
		fscanf(fi, "%s", words[i]);
	qsort(words, n, 21, cmpstr);

	fscanf(fi, "%hd", &q);

	for (i = 0; i < q; i++) {
		fscanf(fi, "%s", s);
		idx = bistr(words, s, n);
		count = idx;
		while (count < n && !strncmp(words[count], s, strlen(s)))
			count++;
		fprintf(fo, "%hd\n", count - idx);
	}

	fclose(fi);
	fclose(fo);

	return 0;
}
