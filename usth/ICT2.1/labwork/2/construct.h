/*
 * Lisp construct header.
 * This is free and unencumbered software released into the public domain.
 */

typedef struct list construct;
struct list {
	void *car;
        construct *cdr;
};

construct *cons(void *, construct *);
void *car(construct *);
construct *cdr(construct *);
size_t length(construct *);
void *nth(construct *, size_t);
construct *insert(void *, construct *, size_t);
