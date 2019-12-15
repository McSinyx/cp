#include "vector.h"

Vector
operator+ (Vector u, Vector v)
{
  return u += v;
}

Vector
operator- (Vector u, Vector v)
{
  return u -= v;
}

Vector
operator* (Vector u, Vector v)
{
  return u *= v;
}
