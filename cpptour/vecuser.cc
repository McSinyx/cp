#include <cmath>
#include <iostream>
#include <stdexcept>

#include "Vector.h"

using namespace std;

double
sqrt_sum (Vector& v)
{
  double sum = 0;
  for (int i = 0; i <= v.size(); ++i)
    try { sum += sqrt(v[i]); }
    catch (out_of_range) { cout << "Yeet!" << endl; }
  return sum;
}

int
main ()
{
  int n;
  cin >> n;
  Vector v (n);
  while (n--)
    cin >> v[n];
  cout << sqrt_sum (v) << endl;
}
