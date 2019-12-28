/*
 * Read coordinates of 2 2D-points from stdin and print their distance to stdout
 * This is free and unencumbered software released into the public domain.
 */

#include <math.h>
#include <stdio.h>

/*
 * The overhead caused by re-evaluating x in this case is much
 * to change this into a function call.
 */
#define SQR(x) ((x) * (x))

/* Conventionally C names are in lowercase */
struct point {
	double x, y;
};

double distance(struct point u, struct point v)
{
	return sqrt(SQR(u.x - v.x) + SQR(u.y - v.y));
}

int main()
{
	struct point m, n;

	scanf("%lf %lf %lf %lf", &m.x, &m.y, &n.x, &n.y);
	printf("%g\n", distance(m, n));

	return 0;
}
