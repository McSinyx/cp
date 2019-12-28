/*
 * Read numbers from stdin to a link list and print their sum to stdout.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>
#include <stdlib.h>

#include "construct.h"

construct *readoubles()
{
	double *x = malloc(sizeof(double));
	if (scanf("%lf", x) != EOF)
		return cons(x, readoubles());
	free(x);
	return NULL;
}

double sum(construct *list)
{
	if (list == NULL)
		return 0.0;
	/* At program termination the memory will be freed anyway. */
	return *(double *) car(list) + sum(cdr(list));
}

int main()
{
	printf("%g\n", sum(readoubles()));
	return 0;
}
