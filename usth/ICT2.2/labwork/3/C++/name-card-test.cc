#include <iostream>

#include "name-card.h"

using namespace std;

int
main ()
{
  NameCard card ("Foobar Baz", "420-69", "foo@bar.baz");
  cout << "Name: " << card.get_name () << endl
       << "Phone: " << card.get_phone () << endl
       << "Email: " << card.get_email () << endl;
}
