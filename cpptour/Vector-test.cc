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

int
main ()
{
  neg_length ();
}
