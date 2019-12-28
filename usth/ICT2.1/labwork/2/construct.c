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

size_t length(construct *list)
{
	if (list == NULL)
		return 0;
	return length(cdr(list)) + 1;
}

void *nth(construct *list, size_t n)
{
	if (list == NULL)
		return NULL;
	return n ? nth(cdr(list), n - 1) : car(list);
}

/*
 * Try to insert x before item of index i and return the new construct.
 * Return NULL on invalid index.
 */
construct *insert(void *x, construct *list, size_t i)
{
	if (!i)
		return cons(x, list);
	if (list == NULL)
		return NULL;

	void *first = car(list);
	construct *rest = cdr(list);
	free(list);
	return cons(first, insert(x, rest, i - 1));
}
