/*
 * Lisp construct implementation.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdlib.h>

#include "construct.h"

construct *cons(void *first, construct *rest)
{
	construct *list = malloc(sizeof(construct));
	list->car = first;
	list->cdr = rest;
	return list;
}

void *car(construct *list)
{
	return list->car;
}

construct *cdr(construct *list)
{
	return list->cdr;
}
