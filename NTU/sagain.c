#include <stdio.h>
#include <stdlib.h>
#include <string.h>

long *hist[26];


void res(char s0[], 


int main()
{
	short k;
	char s[2000001], alpha;
	long length, i, a[26] = {};

	scanf("%hd", k);
	scanf("%s", s);

	length = strlen(s);

	if (length > (k - 1) * 26) {
		for (i = 0; i < length; i++) {
			alpha = s[i] - 97;
			a[alpha]++;

			if (a[alpha] == k) {
				short j;

				for (j = 0; j < a[alpha]; j++)
					printf("%c", alpha + 97);

				printf("\n");
				break;
			}
		}
	} else {
		hist = malloc(208 * length), tmp;
		char map[26], j, chr2use = 0;

		for (i = 0; i < length; i++) {
			alpha = s[i] - 97;
			hist[alpha][a[alpha]] = i;
			a[alpha]++;
		}
		
		for (i = 0; i < 26; i++)
			map[i] = i;

		for (i = 0; i < 25; i++)
			for (j = i; j < 26; j++)
				if (a[j] > a[i]) {
					tmp = map[i];
					map[i] = map[j];
					map[j] = tmp;
				}
	}

	return 0;
}
