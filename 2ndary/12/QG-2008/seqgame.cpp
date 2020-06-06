#include <iostream>
#include <fstream>
#include <set>

#define ABS(x) ((x < 0) ? -x : x)

using namespace std;

int
main()
{
  ifstream infile;
  ofstream outfile;
  short n;
  long i, c, min = 2e9, a;
  set<long> b;
  std::set<long>::iterator k;

  infile.open("SEQGAME.INP");
  infile >> n;
  for (i = 0; i < n; i++)
    {
      infile >> c;
      b.insert(c);
    }

  for (; n--;)
    {
      infile >> c;
      k = b.lower_bound(-c);
      if (*k == -c)
        {
          min = 0;
          break;
        }

      if (k != b.end())
        {
          i = ABS(*k + c);
          if (a < min)
            min = i;
        }

      if (k != b.begin())
        {
          k--;
          i = ABS(*k + c);
          if (a < min)
            min = i;
        }
    }
  infile.close();

  outfile.open("SEQGAME.OUT");
  outfile << min << endl;
  outfile.close();

  return 0;
}
