#include <iostream>
#include <fstream>
#include <functional>
#include <queue>
#include <vector>

#define ENC(a, x, y) (((a) << 16) + ((x) << 8) + (y))

using namespace std;

int
main()
{
  long long m, n, i, j, a[200][200];
  ifstream infile;
  infile.open("HC.INP");
  infile >> m >> n;
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      infile >> a[i][j];
  infile.close();

  priority_queue<long long, vector<long long>, greater<long long>> heap;
  long long path[200][200] = {};
  for (i = 0; i < m; i++)
    {
      heap.push(ENC(*a[i], i, 0));
      path[i][0] = 1;
    }

  long long tmp, x, y;
  while (!heap.empty())
    {
      tmp = heap.top();
      heap.pop();
      x = tmp >> 8 & 255;
      y = tmp & 255;
      tmp >>= 16;
      if (y == n - 1)
        break;

      if (!path[x][y + 1])
        {
          heap.push(ENC(tmp + a[x][y + 1], x, y + 1));
          path[x][y + 1] = 1;
        }

      if (y)
        if (x && !path[x - 1][y])
          {
            heap.push(ENC(tmp + a[x - 1][y], x - 1, y));
            path[x - 1][y] = 1;
          }
        else if (x < m - 1 && !path[x + 1][y])
          {
            heap.push(ENC(tmp + a[x + 1][y], x + 1, y));
            path[x + 1][y] = 1;
          }

      if (y > 1 && !path[x][y - 1])
        {
          heap.push(ENC(tmp + a[x][y - 1], x, y - 1));
          path[x][y - 1] = 1;
        }
    }

  ofstream outfile;
  outfile.open("HC.OUT");
  outfile << tmp << endl;
  outfile.close();

  return 0;
}
