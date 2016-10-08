#include <stdio.h>

typedef struct {
	short x;
	short y;
} point_t;

point_t a, b, c, d;

long long cross_product(point_t m, point_t n, point_t p, point_t q)
{
	return (n.x - m.x) * (q.y - p.y) - (q.x - p.x) * (n.y - m.y);
}

char convex()
{
	if (cross_product(a, c, c, b) * cross_product(a, c, c, d) > 0)
		return 0;
	if (cross_product(b, d, d, a) * cross_product(b, d, d, c) > 0)
		return 0;
	return 1;
}

void swap(point_t *m, point_t *n)
{
	short tmp = m->x;
	m->x = n->x;
	n->x = tmp;
	tmp = m->y;
	m->y = n->y;
	n->y = tmp;
}

long long dot_product(point_t m, point_t n, point_t p, point_t q)
{
	return (n.x - m.x) * (q.x - p.x) + (n.y - m.y) * (q.y - p.y);
}

char f2()
{
	return !dot_product(a, b, b, c);
}

char f3()
{
	return !dot_product(a, c, b, d);
}

char f4()
{
	return (a.x + c.x == b.x + d.x) && (a.y + c.y == b.y + d.y);
}

int main()
{
	scanf("%hd %hd %hd %hd %hd %hd %hd %hd",
	      &a.x, &a.y, &b.x, &b.y, &c.x, &c.y, &d.x, &d.y);

	if (!convex()) {
		swap(&a, &b);
		if (!convex())
			swap(&b, &c);
	}

	char val = 5;
	if (f4()) {
		val = 4;
		if (f2())
			val = 2;
		if (f3())
			val--;
	}

	printf("%hhd\n", val);

	return 0;
}
