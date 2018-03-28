#include <iostream>
#include <fstream>
#include <functional>
#include <map>
#include <queue>
#include <vector>

#define ENC(distance, current, coupon) (((distance) << 14) + ((current) << 1) + coupon)
#define DEC_D(data) ((data) >> 14)
#define DEC_C(data) ((data) >> 1 & 0b1111111111111)
#define DEC_B(data) ((data) & 1)

using namespace std;

int
main()
{
  ifstream infile;
  infile.open("BAI2.INP");
  int n, m;
  infile >> n >> m;
  map<long long, map<long long, long long>> c;
  long long k, i, j, l;
  for (k = 0; k < m; k++)
    {
      infile >> i >> j >> l;
      c[i][j] = l;
    }
  infile.close();

  priority_queue<long long, vector<long long>, greater<long long>> q;
  for (auto& item : c[1])
    {
      q.push(ENC(item.second, item.first, 1));
      q.push(ENC(0, item.first, 0));
    }

  long long tmp;
  while (!q.empty())
    {
      tmp = q.top();
      q.pop();
      if (DEC_C(tmp) == n)
        break;
      for (auto& item : c[DEC_C(tmp)])
        q.push(ENC(DEC_D(tmp) + item.second, item.first, DEC_B(tmp)));
      if (DEC_B(tmp))
        for (auto& item : c[DEC_C(tmp)])
          q.push(ENC(DEC_D(tmp), item.first, 0));
    }

  ofstream outfile;
  outfile.open("BAI2.OUT");
  outfile << DEC_D(tmp) << endl;
  outfile.close();

  return 0;
}
