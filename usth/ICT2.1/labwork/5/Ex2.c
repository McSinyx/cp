/*
 * Merge sorting integers from stdin
 * Copyright (C) 2019,  Nguyễn Gia Phong
 * This software is licenced under a CC BY-SA 4.0 license
 */

#include <stdio.h>
#include <stdlib.h>

#include "construct.h"

construct *merge(construct *left, construct *right,
                 int (*compar)(const void *, const void *))
{
	if (left == NULL)
		return right;
	if (right == NULL)
		return left;
	if (compar(car(left), car(right)) <= 0)
		return cons(car(left), merge(cdr(left), right, compar));
	return cons(car(right), merge(left, cdr(right), compar));
}

construct *msort(construct *list, int (*compar)(const void *, const void *))
{
	construct *rest, *left = NULL, *right = NULL;
	while (list != NULL) {
		left = cons(car(list), left);
		rest = cdr(list);
		if (rest == NULL)
			break;
		right = cons(car(rest), right);
		list = cdr(rest);
	}
	if (left == NULL)
		return right;
	if (right == NULL)
		return left;
	return merge(msort(left, compar), msort(right, compar), compar);
}

int cmp(const void *x, const void *y)
{
	return *(int *) x - *(int *) y;
}

construct *iread(size_t n)
{
	if (!n)
		return NULL;
	int *tmp = malloc(sizeof(int));
	scanf("%d", tmp);
	return cons(tmp, iread(n - 1));
}

void iprint(construct *list)
{
	if (list == NULL) {
		putchar(10);
	} else {
		printf("%d ", *(int *) car(list));
		iprint(cdr(list));
	}
}

int main()
{
	size_t n;

	scanf("%zu", &n);
	iprint(msort(iread(n), cmp));

	return 0;
}
