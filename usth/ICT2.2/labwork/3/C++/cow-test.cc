#include "cow.h"

int
main ()
{
  Cow cow ("foo", "bar", 7);
  cow.age = -4;   // some casting happens here
  cow.moo ();
}
