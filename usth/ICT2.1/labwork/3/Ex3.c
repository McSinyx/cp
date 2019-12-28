/*
 * Interactive guessing game.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "stack.h"

char *random10(char *c)
{
	char *p = malloc(sizeof(char));
	*p = rand() % 10;
	while (c != NULL && *p == *c) {
		free(p);
		p = malloc(sizeof(char));
		*p = rand() % 10;
	}
	return p;
}

int main()
{
	stack *s = mkstack();
	char guess, lost = 0;
	srand(time(NULL));
	stack_push(s, random10(NULL));
STEP2:
	stack_push(s, random10(stack_top(s)));
	char *p = stack_pop(s);
	puts(lost ? "Make another guess between 0 and 9"
		  : "Make a guess between 0 and 9");
	scanf("%hhd", &guess);
	if ((guess - *p) * (guess - *(char *) stack_top(s)) < 0) {
		puts("YOU WIN!");
		return 0;
	} else if (lost) {
		puts("YOU LOSE!");
		return 0;
	}
	
	lost = 1;
	goto STEP2;
}
