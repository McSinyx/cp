/*
 * Add hard-coded names to a queue a print them to stdout.
 * This is free and unencumbered software released into the public domain.
 */

#include <stdio.h>
#include <stdlib.h>

#include "construct.h"

typedef struct {
	construct *front;
	construct *rear;
} queue;

queue *mkq()
{
	queue *q = malloc(sizeof(queue));
	q->front = q->rear = NULL;
}

int qempty(queue *q)
{
	return q->front == NULL;
}

void qpush(queue *q, void *item)
{
	if (qempty(q))
		q->front = q->rear = cons(item, NULL);
	else
		q->rear = q->rear->cdr = cons(item, NULL);
}

void *qpop(queue *q)
{
	if (qempty(q))
		return NULL;
	void *first = car(q->front);
	construct *rest = cdr(q->front);
	free(q->front);
	q->front = rest;
	return first;
}

int main()
{
	queue *q = mkq();	
	qpush(q, "Mahathir Mohamad");
	qpush(q, "Elizabeth II");
	qpush(q, "Sheikh Sabah Al-Ahmad Al-Jaber Al-Sabah");
	qpush(q, "Paul Biya");
	qpush(q, "Michel Aoun");
	qpush(q, "Mahmoud Abbas");
	qpush(q, "Francis");

	while (!qempty(q))
		puts(qpop(q));

	return 0;
}
