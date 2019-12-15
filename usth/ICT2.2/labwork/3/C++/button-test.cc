#include <iostream>

#include "button.h"

using namespace std;

int
main ()
{
  Button butt ("foo", "bar");
  butt.depress ();
  butt.undepress ();
  cout << "button " << butt.label << " color " << butt.color << endl;
}
