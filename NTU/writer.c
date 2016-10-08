#include <stdio.h>
#include <string.h>

typedef char *string;

const string KEYBOARD[10] = {"_0", ".,?!1", "abc2", "def3", "ghi4", "jkl5",
                             "mno6", "pqrs7", "tuv8", "wxyz9"};
struct Foo {
	char num;
	char times;
};

struct Foo get(char letter)
{
	struct Foo val;
	char len;

	for (val.num = 0; val.num < 10; val.num++) {
		len = strlen(KEYBOARD[val.num]);
		for (val.times = 0; val.times < len; val.times++)
			if (KEYBOARD[val.num][val.times] == letter) {
				val.times++;
				return val;
			}
	}
}

int main()
{
	char t, i, s[50][1000];

	scanf("%hhd", &t);
	for (i = 0; i < t; i++)
		scanf("%s", s[i]);

	short time, j;
	struct Foo f00;
	char olechr;

	for (i = 0; i < t; i++) {
		time = 0;
		olechr = 1;
		for (j = 0; j < strlen(s[i]); j++) {
			f00 = get(s[i][j]);
			time += f00.times;
			if (f00.num != olechr)
				time++;
			olechr = f00.num;
		}
		printf("%hd\n", time);
	}
}
