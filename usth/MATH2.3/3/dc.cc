#include <cmath>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int
main ()
{
  double num, x, y;
  string op;
  vector<double> v;

  while (cin.peek () != '\n')
    {
      getline (cin, op, ';');
      stringstream s {op};
      s >> num;
      if (s)
        {
          v.push_back (num);
          continue;
        }

      y = v.back ();
      v.pop_back ();
      x = v.back ();
      v.pop_back ();
      if (op == "^")
        v.push_back (pow (x, y));
      else if (op == "+")
        v.push_back (x + y);
      else if (op == "-")
        v.push_back (x - y);
      else if (op == "*")
        v.push_back (x * y);
      else if (op == "/")
        v.push_back (x / y);
    }
  cout << v.back () << endl;
}
