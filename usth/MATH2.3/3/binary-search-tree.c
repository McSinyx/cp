#include <stdio.h>
#include <stdlib.h>

#define MKTREE(entry, left, right) (cons((entry), cons((left), cons((right), NULL))))
#define ENTRY(tree) (car((tree)))
#define LEFT(tree) (car(cdr((tree))))
#define RIGHT(tree) (car(cdr(cdr((tree)))))

typedef struct list construct;
struct list {
	void *car;
        construct *cdr;
};

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

construct *insert(void *a, construct *tree)
{
	if (tree == NULL)
		return MKTREE(a, NULL, NULL);
	if (*(int *) a < *(int *) ENTRY(tree))
		return MKTREE(ENTRY(tree), insert(a, LEFT(tree)), RIGHT(tree));
	return MKTREE(ENTRY(tree), LEFT(tree), insert(a, RIGHT(tree)));
}

void display(construct *tree, size_t indent)
{
	if (tree == NULL)
		return;
	display(LEFT(tree), indent + 1);
	for (size_t i = 0; i++ < indent; putchar(9));
	printf("%d", *(int *) ENTRY(tree));
	putchar(10);
	display(RIGHT(tree), indent + 1);
}

int main()
{
	size_t n;
	scanf("%zu", &n);

	construct *tree = NULL;
	while (n--) {
		int *a = malloc(sizeof(int));
		scanf("%d", a);
		tree = insert(a, tree);
	}

	display(tree, 0);

	return 0;
}
