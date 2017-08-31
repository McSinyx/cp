#include <cstdlib>
#include <iostream>
#include <fstream>
#include <queue>
#include <vector>
#include <functional>
using namespace std;

#define POINT(x, y) (((x) << 7) + (y))
#define ENC(s, x, y) (((s) << 14) + ((x) << 7) + (y))

void
explore(short x, short y, short n, short a[102][102], short* p[102][102])
{
  short i, j;
  short* area = p[x][y];
  queue<short> q;
  q.push(POINT(x, y));

  while (!q.empty())
    {
      i = q.front();
      q.pop();
      j = i & 127;
      i >>= 7;

      if (i > 1 && a[i - 1][j] && !p[i - 1][j])
        {
          (*area)++;
          p[i - 1][j] = area;
          q.push(POINT(i - 1, j));
        }
      if (i < n && a[i + 1][j] && !p[i + 1][j])
        {
          (*area)++;
          p[i + 1][j] = area;
          q.push(POINT(i + 1, j));
        }
      if (j > 1 && a[i][j - 1] && !p[i][j - 1])
        {
          (*area)++;
          p[i][j - 1] = area;
          q.push(POINT(i, j - 1));
        }
      if (j < n && a[i][j + 1] && !p[i][j + 1])
        {
          (*area)++;
          p[i][j + 1] = area;
          q.push(POINT(i, j + 1));
        }
    }
}

int
main()
{
  short n, x, y, i, j, a[102][102] = {};
  ifstream infile;
  infile.open("VDD.INP");
  infile >> n >> x >> y;
  for (i = 1; i <= n; i++)
    for (j = 1; j <= n; j++)
      infile >> a[i][j];
  infile.close();

  short* p[102][102] = {};
  for (i = 1; i <= n; i++)
    for (j = 1; j <= n; j++)
      if (a[i][j] && !p[i][j])
        {
          p[i][j] = (short*) malloc(sizeof(short));
          *p[i][j] = 1;
          explore(i, j, n, a, p);
        }

  priority_queue<long, vector<long>, greater<long>> heap;
  bool visited[102][102] = {};
  queue<short> q;
  visited[x][y] = true;
  q.push(POINT(x, y));
  while (!q.empty())
    {
      i = q.front();
      q.pop();
      j = i & 127;
      i >>= 7;
      if (!(a[i + 1][j] && a[i][j + 1] && a[i - 1][j] && a[i][j - 1]))
        heap.push(POINT(i, j));

      if (i > 1 && !visited[i - 1][j] && a[i - 1][j])
        {
          q.push(POINT(i - 1, j));
          visited[i - 1][j] = true;
        }
      if (i < n && !visited[i + 1][j] && a[i + 1][j])
        {
          q.push(POINT(i + 1, j));
          visited[i + 1][j] = true;
        }
      if (j > 1 && !visited[i][j - 1] && a[i][j - 1])
        {
          q.push(POINT(i, j - 1));
          visited[i][j - 1] = true;
        }
      if (j < n && !visited[i][j + 1] && a[i][j + 1])
        {
          q.push(POINT(i, j + 1));
          visited[i][j + 1] = true;
        }
    }

  short* current = p[x][y], s = 12345;
  long tmp;
  while (!heap.empty())
    {
      tmp = heap.top();
      heap.pop();
      i = tmp >> 7 & 127;
      j = tmp & 127;
      tmp >>= 14;
      if (tmp > s)
        break;
      if (p[i][j] && p[i][j] != current)
        if (*p[i][j] <= *current)
          continue;
        else
          {
            s = tmp;
            *current = *p[i][j];
          }

      tmp++;
      if (i && !visited[i - 1][j])
        {
          heap.push(ENC(tmp, i - 1, j));
          visited[i - 1][j] = true;
        }
      if (i < n + 1 && !visited[i + 1][j])
        {
          heap.push(ENC(tmp, i + 1, j));
          visited[i + 1][j] = true;
        }
      if (j && !visited[i][j - 1])
        {
          heap.push(ENC(tmp, i, j - 1));
          visited[i][j - 1] = true;
        }
      if (j < n + 1 && !visited[i][j + 1])
        {
          heap.push(ENC(tmp, i, j + 1));
          visited[i][j + 1] = true;
        }
    }

  ofstream outfile;
  outfile.open("VDD.OUT");
  outfile << (s == 12345 ? 0 : s - 1) << endl;
  outfile.close();

  return 0;
}
