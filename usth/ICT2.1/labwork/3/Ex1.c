/*
 * Reverse name from stdin.
 * This is free and unencumbered software released into the public domain.
 */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

#include "stack.h"

int main()
{
	stack *s = mkstack();
	char c, *p;

	while ((c = getchar()) != EOF) {
		p = malloc(sizeof(char *));
		*p = isspace(c) ? 32 : c;
		stack_push(s, p);
	}

	while (!stack_empty(s) && *(char *) stack_top(s) == 32) {
		p = stack_pop(s);
		free(p);
	}

	c = 32;
	while (!stack_empty(s)) {
		p = stack_pop(s);
		putchar(c == 32 ? toupper(c = *p) : tolower(c = *p));
		free(p);
	}

	putchar(10);

	return 0;
}
