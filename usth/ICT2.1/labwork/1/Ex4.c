/*
 * Print the area of the rectangle constructed from a pair of 2D points
 * and check if a point it within this rectangle
 * This is free and unencumbered software released into the public domain.
 */

#include <math.h>
#include <stdio.h>

/* Writing a header for just a simple struct would be overkill. */
struct point {
	double x, y;
};

struct rect {
	struct point u, v;
};

double area(struct rect r)
{
	return fabs((r.u.x - r.v.x) * (r.u.y - r.v.y));
}

int isin(struct point p, struct rect r)
{
	return ((p.x - r.u.x) * (p.x - r.v.x) < 0
	        && (p.y - r.u.y) * (p.y - r.v.y) < 0);
}

int main()
{
	struct point m, n;
	/* Don't bother logging errors, since it would pollute the pipe. */
	do {
		scanf("%lf %lf %lf %lf", &m.x, &m.y, &n.x, &n.y);
	} while (m.x == n.x || m.y == n.y);

	struct rect r = {m, n};
	printf("%g\n", area(r));

	struct point p;
	scanf("%lf %lf", &p.x, &p.y);
	printf("%d\n", isin(p, r));

	return 0;
}
