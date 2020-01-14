#include <iostream>

using namespace std;

int
main ()
{
  size_t n;
  int b;
  cin >> n;
  for (size_t i = 0; i < n; ++i)
    for (size_t j = 0; j < n; ++j)
      {
        cin >> b;
        if (i <= j && b > 0)
          cout << i << " " << j << " " << b << endl;
      }
}
