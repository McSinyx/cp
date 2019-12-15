#include <stdio.h>
#include <string.h>

void ln1(char len)
{
	char i;

	for (i = 0; i < len; i++) {
		if (i % 12 == 10)
			putchar(42);
		else if (i % 4 == 2)
			putchar(35);
		else
			putchar(46);
	}

	putchar(10);
}

void ln2(char len)
{
	char i;

	for (i = 0; i < len; i++) {
		if (i % 12 == 9 || i % 12 == 11)
			putchar(42);
		else if (i % 2)
			putchar(35);
		else
			putchar(46);
	}

	putchar(10);
}

void ln3(char *s)
{
	char i;

	printf("#.%c.", *s);

	for (i = 1; i < strlen(s); i++) {
		if (i % 3 == 1)
			printf("#.%c.", s[i]);
		else
			printf("*.%c.", s[i]);
	}

	if (strlen(s) % 3)
		puts("#");
	else
		puts("*");
}

int main()
{
	char s[16], len;

	scanf("%s", s);
	len = strlen(s) * 4 + 1;

	ln1(len);
	ln2(len);
	ln3(s);
	ln2(len);
	ln1(len);

	return 0;
}
