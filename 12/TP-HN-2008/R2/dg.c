#include <math.h>
#include <stdio.h>

#define ABS(x) (((x) < 0) ? -(x) : (x))
#define SQR(x) ((x) * (x))
#define DET(a, b, c, d) ((a) * (d) - (b) * (c))
#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define MAX(a, b) (((a) > (b)) ? (a) : (b))

typedef struct {
	long x, y;
} poin_t;

typedef struct {
	float x, y;
} fpoin_t;

long area2(poin_t A, poin_t B, poin_t C)
{
	return ABS(DET(C.x - A.x, A.x - B.x, C.y - A.y, A.y - B.y));
}

int main()
{
	FILE *f = fopen("DG.INP", "r");
	char n, i, c = 0, b;
	poin_t M, N, P, Q, polygon[101];
	fpoin_t tmp, intersections[2];
	long Mout = 0, Nout, d;
	double res;

	fscanf(f, "%hhd", &n);
	for (i = 0; i < n; i++)
		fscanf(f, "%ld %ld", &polygon[i].x, &polygon[i].y);
	fscanf(f, "%ld %ld %ld %ld", &M.x, &M.y, &N.x, &N.y);
	fclose(f);
	f = fopen("DG.OUT", "w");
	if (M.x == N.x && M.y == N.y) {
		fputs("0\n", f);
		fclose(f);
		return 0;
	}

	for (i = 1; i < n - 1; i++)
		Mout += area2(*polygon, polygon[i], polygon[i + 1]);
	for (Nout = Mout, polygon[n] = *polygon, i = 0; i < n; i++) {
		Mout -= area2(M, polygon[i], polygon[i + 1]);
		Nout -= area2(N, polygon[i], polygon[i + 1]);
	}
	if (!Mout && !Nout) {
		fprintf(f, "%ld\n",
		        (long) (sqrt(SQR(M.x - N.x) + SQR(M.y - N.y)) * 100));
		fclose(f);
		return 0;
	}

	for (i = 0; i < n; i++) {
		P = polygon[i];
		Q = polygon[i + 1];
		d = DET(M.x - N.x, M.y - N.y, P.x - Q.x, P.y - Q.y);
		if (!d)
			continue;

		tmp.x = DET(DET(M.x, M.y, N.x, N.y), M.x - N.x,
		            DET(P.x, P.y, Q.x, Q.y), P.x - Q.x) / (double) d;
		tmp.y = DET(DET(M.x, M.y, N.x, N.y), M.y - N.y,
		            DET(P.x, P.y, Q.x, Q.y), P.y - Q.y) / (double) d;

		if (tmp.x < MAX(MIN(M.x, N.x), MIN(P.x, Q.x))
		    || tmp.x > MIN(MAX(M.x, N.x), MAX(P.x, Q.x))
		    || tmp.y < MAX(MIN(M.y, N.y), MIN(P.y, Q.y))
		    || tmp.y > MIN(MAX(M.y, N.y), MAX(P.y, Q.y)))
			continue;

		for (b = d = 0; d < c; d++)
			if (intersections[d].x == tmp.x
			    && intersections[d].y == tmp.y)
				b = 1;
		if (b)
			continue;

		intersections[c].x = tmp.x;
		intersections[c].y = tmp.y;
		c++;
	}

	if (!Mout && c)
		res = SQR(M.x - intersections[0].x)
		      + SQR(M.y - intersections[0].y);
	else if (!Nout && c)
		res = SQR(N.x - intersections[0].x)
		      + SQR(N.y - intersections[0].y);
	else if (c == 2)
		res = SQR(intersections[0].x - intersections[1].x)
		      + SQR(intersections[0].y - intersections[1].y);
	else
		res = 0;
	fprintf(f, "%ld\n", (long) (sqrt(res) * 100));
	fclose(f);

	return 0;
}
