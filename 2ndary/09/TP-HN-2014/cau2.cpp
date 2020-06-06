#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

int
main()
{
  ifstream infile;
  infile.open("CAU2.INP");
  short n, i, j;
  long d, count = 0;
  infile >> n >> d;
  short* v = (short*) malloc(n * sizeof(short));
  for (i = 0; i < n; i++)
    {
      infile >> v[i];
      for (j = 0; j < i; j++)
        if (d * (v[i] - v[j]) > v[i] * v[j] * (i - j))
          count++;
    }
  infile.close();
  free(v);

  ofstream outfile;
  outfile.open("CAU2.OUT");
  outfile << count << endl;
  outfile.close();

  return 0;
}
