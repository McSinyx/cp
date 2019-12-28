/*
 * Lisp construct implementation.
 * Copyright (C) 2019,  Nguyễn Gia Phong
 * This software is licenced under a CC BY-SA 4.0 license
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
