#include <iostream>
#include <fstream>

using namespace std;

long
gcd(long x, long y)
{
  long z;
  while (y)
    {
      z = x;
      x = y;
      y = z % x;
    }

  return x;
}

int
main()
{
  ifstream infile;
  long a, b, c, d;
  infile.open("CAU1.INP");
  infile >> a >> b >> c >> d;
  infile.close();

  long y = b * d / gcd(b, d);
  long x = a * y / b - c * y / d;
  if (!x)
    y = 1;
  else
    {
      a = gcd(x, y);
      x /= a;
      y /= a;
      if (y < 0)
        {
          x *= -1;
          y *= -1;
        }
    }

  ofstream outfile;
  outfile.open("CAU1.OUT");
  outfile << x << ' ' << y << endl;
  outfile.close();

  return 0;
}
