#include <iostream>

#include "shopping-cart.h"

using namespace std;

int
main ()
{
  ShoppingCart cart;
  cart.add_to_cart ("foo");
  cart.add_to_cart ("foo");
  cart.add_to_cart ("bar");
  cart.remove_from_cart ("baz");
  cout << cart.count ("foo") << ' '
       << cart.count ("bar") << ' '
       << cart.count ("baz") << endl;
  cart.check_out ();
}
