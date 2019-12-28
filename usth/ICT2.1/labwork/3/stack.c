/*
 * Stack implemented using linked list.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdlib.h>

#include "stack.h"

stack *mkstack()
{
	stack *s = malloc(sizeof(stack));
	s->stack = NULL;
	return s;
}

int stack_empty(stack *s)
{
	return s->stack == NULL;
}

void stack_push(stack *s, void *item)
{
	s->stack = cons(item, s->stack);
}

void *stack_top(stack *s)
{
	return car(s->stack);
}

void *stack_pop(stack *s)
{
	void *first = car(s->stack);
	construct *rest = cdr(s->stack);
	free(s->stack);
	s->stack = rest;
	return first;
}
