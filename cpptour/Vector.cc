#include <stdexcept>

#include "Vector.h"

using namespace std;

Vector::Vector (int s)
{
  if (s < 0)
    throw length_error{"You're being negetive!"};
  elem = new double[s];
  sz = s;
}

Vector::Vector (initializer_list<double> lst)
: elem {new double[lst.size()]}, sz {static_cast<int> (lst.size())}
{
  copy(lst.begin(), lst.end(), elem);
}

Vector::~Vector ()
{
  delete[] elem;
}

int
Vector::size () noexcept
{
  return sz;
}

double&
Vector::operator[] (int i)
{
  if (i < 0 || size() <= i)
    throw out_of_range{"Vector::operator[]"};
  return elem[i];
}
