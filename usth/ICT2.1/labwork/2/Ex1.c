/*
 * Train represented using linked list by lisp-like constructs.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "construct.h"

#define N 7
#define LEN_MAX 42
#define PSNGR_MAX 5	/* this raises the chance of empty vehicle */

struct vehicle {
	int passengers;
	char *name;
};

void free_vehicle(struct vehicle *v)
{
	free(v->name);
	free(v);
}

struct vehicle *mkvehicle(int passengers, char *name)
{
	struct vehicle *v = malloc(sizeof(struct vehicle));
	v->passengers = passengers;
	v->name = name;
	return v;
}

struct vehicle *rand_vehicle()
{
	int len = rand() % LEN_MAX + 2;	/* avoid empty name */
	char *name = malloc(len--);
	for (int j = 0; j < len; ++j)
		name[j] = 'a' + rand() % 26;
	name[len] = 0;
	return mkvehicle(rand() % PSNGR_MAX, name);
}

void print_vehicle(struct vehicle *v)
{
	printf("%s (%d passengers)\n", v->name, v->passengers);
}

void print_train(construct *train)
{
	if (train == NULL)
		return;
	print_vehicle(car(train));
	print_train(cdr(train));
}

/* Remove empty vehicles */
construct *optimize_train(construct *train)
{
	if (train == NULL)
		return NULL;
	struct vehicle *first = car(train);
	construct *rest = cdr(train);
	free(train);

	if (first->passengers)
		return cons(first, optimize_train(rest));
	free_vehicle(first);
	return optimize_train(rest);
}

int main()
{
	construct *train = NULL;

	srand(time(NULL));
	for (int i = 0; i < N; ++i)
		train = cons(rand_vehicle(), train);
	puts("Initial train:");
	print_train(train);
	putchar(10);

	train = optimize_train(train);
	puts("Optimized train:");
	print_train(train);
	putchar(10);

	int index = rand() % length(train);
	struct vehicle *v = rand_vehicle();
	while (!v->passengers) {
		free(v);
		v = rand_vehicle();
	}
	train = insert(v, train, index);
	printf("Train after inserting a new one at index %d:\n", index);
	print_train(train);

	return 0;
}
