/*
 * Read one natural number from stdin and print its prime factors to stdout
 * The time complexity analysis of this program is commented in the source code
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct list construct;
struct list {
	void *car;
        construct *cdr;
};

typedef struct {
	construct *stack;
} stack;

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

int main()
{
	int n, m;		/* Θ(1) */
	stack *s = mkstack();	/* Θ(1) */

	scanf("%d", &n);	/* Θ(1) */
	m = n;			/* Θ(1) */
	/*
	 * Let P be the sequence of prime factors of n and l be length of P.
	 * Let T(n, 2) be the time complexity of this for loop.
	 * Consider the function T(n, i):
	 *     T(n, i) = Θ(1) if i*i >= n
	 *     T(n, i) = T(n, i + 1) + Θ(1) if n is not divisible by i	(*)
	 *     T(n, i) = T(n/i, i) + Θ(1) if n is divisible by i	(**)
	 *
	 * If only the (*) recurrence occurs, it is the worst case and
	 *     T(n, 2) = sum(Θ(1) for i from 2 to floor(sqrt(n))) = Θ(sqrt(n))
	 *
	 * If only the (**) recurrence occurs, it is the best case where n
	 * is power of 2.  For convenience, we define R(n) = T(n, 2) and get
	 *     R(n) = 1R(n/2) + Θ(n^log2(1))
	 * By the master theorem,
	 *     R(n) = Θ(n^log2(1) lg(n)) = Θ(lg(n)).
	 *
	 * If both occurs (average case), I can imagine that there exist numbers
	 * n_0, n_1, etc. and m_0, m_1, etc. that
	 *     T(n, 2) = sum(Θ(sqrt(n_i))) + sum(Θ(lg(m_i))) = Θ(sqrt(n))
	 * I, however, fail to formulate a rigorous proof for this.
	 */
	for (int i = 2; i * i <= n; ++i)
		while (n % i == 0) {
			int *tmp = malloc(sizeof(int)); /* Θ(1) */
			*tmp = i;			/* Θ(1) */
			stack_push(s, tmp);		/* Θ(1) */
			n /= i;				/* Θ(1) */
		}
	if (n != 1) {
		int *tmp = malloc(sizeof(int));
		*tmp = n;
		stack_push(s, tmp);
	}	/* Θ(1) */

	/*
	 * Since each iteration of the loop above produce at most one
	 * prime factor, the time complexity of the loop below is O(T(n, 2)).
	 */
	while (!stack_empty(s)) {
		printf("%d * ", *(int *) stack_top(s));		/* Θ(1) */
		stack_pop(s);					/* Θ(1) */
	}
	/* Terrible hack, not even portable (depending on flush behavior) */
	printf("\b\b= %d\n", m);				/* Θ(1) */

	return 0;
}

/*
 * Conclusion on time complexity:
 * Best case:  Θ(lg(n)) + O(Θ(lg(n))) = Θ(lg(n))
 * Average case and worst case:  Θ(sqrt(n)) + O(Θ(sqrt(n))) = Θ(sqrt(n))
 */
