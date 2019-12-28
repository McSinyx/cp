/*
 * Stack header.
 * This is free and unencumbered software released into the public domain.
 */

#include "construct.h"

typedef struct {
	construct *stack;
} stack;

stack *mkstack();
int stack_empty(stack *);
void stack_push(stack *, void *);
void *stack_top(stack *);
void *stack_pop(stack *);
