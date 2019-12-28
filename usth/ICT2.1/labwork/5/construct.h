/*
 * Lisp construct header.
 * Copyright (C) 2019,  Nguyễn Gia Phong
 * This software is licenced under a CC BY-SA 4.0 license
 */

typedef struct list construct;
struct list {
	void *car;
        construct *cdr;
};

construct *cons(void *, construct *);
void *car(construct *);
construct *cdr(construct *);
