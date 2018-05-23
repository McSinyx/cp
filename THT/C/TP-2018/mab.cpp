#include <iostream>
#include <fstream>
#include <set>
#include <vector>
using namespace std;

int
main()
{
  ifstream infile;
  infile.open("MAB.INP");
  int m, n, k;
  infile >> m >> n >> k;

  int i, j;
  long tmp;
  vector<vector<long>> a;
  a.resize(m);
  vector<set<long>> r;
  r.resize(m);
  vector<set<long>> c;
  c.resize(n);
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      {
        infile >> tmp;
        a[i].push_back(tmp);
        r[i].insert(tmp);
        c[j].insert(tmp);
      }

  vector<vector<long>> rows, columns;
  rows.resize(m);
  for (i = 0; i < m; i++)
    for (auto& item : r[i])
      rows[i].push_back(item);
  columns.resize(n);
  for (i = 0; i < n; i++)
    for (auto& item : c[i])
      columns[i].push_back(item);

  int alpha, beta;
  vector<vector<long>> mem;
  mem.resize(m);
  for (i = 0; i < m; i++)
    mem[i].resize(n);
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      {
        tmp = a[i][j];
        alpha = lower_bound(rows[i].begin(), rows[i].end(), tmp) - rows[i].begin();
        beta = lower_bound(columns[j].begin(), columns[j].end(), tmp) - columns[j].begin();
        mem[alpha][n - beta - 1]++;
      }
  for (i = 0; i < m; i++)
    for (j = 1; j < n; j++)
      mem[i][j] += mem[i][j - 1];
  for (i = 1; i < m; i++)
    for (j = 0; j < n; j++)
      mem[i][j] += mem[i - 1][j];

  ofstream outfile;
  outfile.open("MAB.OUT");
  while (k--)
    {
      infile >> alpha >> beta;
      if (alpha == m)
        alpha--;
      if (beta == n)
        beta--;
      outfile << mem[alpha][beta] << endl;
    }

  infile.close();
  outfile.close();
  return 0;
}
