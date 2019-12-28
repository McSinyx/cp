/*
 * Polynomial represented using linked list, with free coefficient at last.
 * This is free and unencumbered software released into the public domain.
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "construct.h"

#define COEFF_MOD 42

/*
 * Add addition to the coefficient of power n of poly if it already exists.
 * Return the mutated polynomial on success and NULL otherwise.
 */
construct *add_term(construct *poly, double addition, size_t n)
{
	double *term = nth(poly, length(poly) - n - 1);
	if (term == NULL)
		return NULL;
	*term += addition;
	return poly;
}

/* Remove the nth term and return the mutated polynomial. */
construct *remove_term(construct *poly, size_t n)
{
	if (poly == NULL)
		return NULL;
	size_t len = length(poly);
	if (++n == len) {
		construct *rest = cdr(poly);
		free(car(poly));
		free(poly);
		return rest;
	}

	double *term = nth(poly, len - n);
	if (term == NULL)
		return poly;
	*term = 0;
	return poly;
}

/*  Evaluate the polynomial poly of the length len at the specified value. */
double polyval(construct *poly, double value, size_t len)
{
	if (!len--)
		return 0;
	double coeff = *(double *) car(poly);
	return pow(value, len) * coeff + polyval(cdr(poly), value, len);
}

/* Print the polynomial poly of the length len using the specified varname. */
void polyprint(construct *poly, char *varname, size_t len)
{
	if (len--) {
		printf(len ? "%g%s^%zu + " : "%g",
		       *(double *) car(poly), varname, len);
		polyprint(cdr(poly), varname, len);
	} else {
		putchar(10);
	}
}

int main()
{
	construct *polynomial = NULL;
	srand(time(NULL));
	int len = rand() % 4 + 3;

	for (int i = 0; i < len; ++i) {
		double *coeff = malloc(sizeof(double));
		*coeff = rand() % COEFF_MOD;
		polynomial = cons(coeff, polynomial);
	}

	puts("Initial polynomial:");
	polyprint(polynomial, "x", len);

	double x = rand() % COEFF_MOD;
	int n = rand() % len;
	polynomial = add_term(polynomial, x, n);
	printf("The polynomial after adding %g to the number %d term:\n", x, n);
	polyprint(polynomial, "x", len);

	polynomial = remove_term(polynomial, --len);
	printf("The polynomial after removing the number %d term:\n", len);
	polyprint(polynomial, "x", len);

	n = rand() % (len - 1);
	polynomial = remove_term(polynomial, n);
	printf("The polynomial after removing the number %d term:\n", n);
	polyprint(polynomial, "x", len);

	puts("Evaluation of the polynomial using x from stdin:");
	scanf("%lf", &x);
	printf("%g\n", polyval(polynomial, x, len));

	return 0;
}
