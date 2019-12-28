// Read two integers from stdin and print their sum and product
// This is free and unencumbered software released into the public domain.

#include <iostream>

using namespace std;

int
add (int& a, int& b)
{
  return a + b;
}

int
mul (int& a, int& b)
{
  return a * b;
}

int
main ()
{
  int a;
  int b;

  cin >> a >> b;
  cout << add (a, b) << endl << mul (a, b) << endl;
}
