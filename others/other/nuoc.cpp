#include <functional>
#include <queue>
#include <vector>
#include <iostream>
#include <fstream>

#define MAX(a, b) (((a) < (b)) ? (b) : (a))
#define ENC(h, x, y) (((h) << 14) + ((x) << 7) + (y))
#define DEC_H(e) ((e) >> 14)
#define DEC_X(e) ((e) >> 7 & 127)
#define DEC_Y(e) ((e) & 127)

using namespace std;

int
main()
{
  ifstream infile;
  long m, n, i, j, height[100][100];
  infile.open("NUOC.INP");
  infile >> m >> n;
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      infile >> height[i][j];
  infile.close();

  priority_queue<long, vector<long>, greater<long>> heap;
  bool visited[100][100] = {};
  for (i = 0; i < m; i++)
    {
      heap.push(ENC(height[i][0], i, 0));
      visited[i][0] = true;
      heap.push(ENC(height[i][n - 1], i, n - 1));
      visited[i][n - 1] = true;
    }
  for (i = 0; i < n; i++)
    {
      heap.push(ENC(height[0][i], 0, i));
      visited[0][i] = true;
      heap.push(ENC(height[m - 1][i], m - 1, i));
      visited[m - 1][i] = true;
    }

  long h, x, y;
  long result = 0, tmp;
  while (!heap.empty())
    {
      tmp = heap.top();
      heap.pop();
      h = DEC_H(tmp);
      i = DEC_X(tmp);
      j = DEC_Y(tmp);
      long adjacents[4][2] = {{i + 1, j}, {i, j + 1}, {i - 1, j}, {i, j + 1}};
      for (auto a: adjacents)
        {
          x = a[0];
          y = a[1];
          if (x >= 0 && x < m && y >= 0 && y < n && !visited[x][y])
            {
              result += MAX(0, h - height[x][y]);
              heap.push(ENC(MAX(height[x][y], h), x, y));
              visited[x][y] = true;
            }
        }
    }

  ofstream outfile;
  outfile.open("NUOC.OUT");
  outfile << result << endl;
  outfile.close();

  return 0;
}
