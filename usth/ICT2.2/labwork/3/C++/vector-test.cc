#include <iostream>

#include "vector.h"

using namespace std;

int
main ()
{
  Vector u (4, 20);
  Vector v (6, 9);
  cout << "u = (" << u.x << ", " << u.y << ")" << endl;
  cout << "v = (" << v.x << ", " << v.y << ")" << endl;
  Vector w {u + v};
  cout << "u + v = (" << w.x << ", " << w.y << ")" << endl;
  w = u - v;
  cout << "u - v = (" << w.x << ", " << w.y << ")" << endl;
  w = u * v;
  cout << "u * v = (" << w.x << ", " << w.y << ")" << endl;
}
