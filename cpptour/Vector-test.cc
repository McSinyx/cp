#include <cassert>
#include <iostream>
#include <stdexcept>

#include "Vector.h"

using namespace std;

void
neg_length ()
{
  try { Vector v (-27); }
  catch (length_error) { cout << "it's alright" << endl; }
  catch (bad_alloc) { cout << "BIG OOF!" << endl; }
}

void
init ()
{
  Vector v {7.4, 3.2, 5.2, 6.9, 9.5, 4.2, 21.7};
  assert(v[5] == 4.2);
}

int
main ()
{
  neg_length ();
  init ();
}
