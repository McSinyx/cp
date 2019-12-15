#include <stdio.h>

int main()
{
	char i, mod[42] = {};
	short a;

	for (i = 0; i < 10; i++) {
		scanf("%hd", &a);
		mod[a % 42]++;
	}

	a = 0;
	for (i = 0; i < 42; i++)
		if (mod[i])
			a++;

	printf("%hd\n", a);

	return 0;
}
