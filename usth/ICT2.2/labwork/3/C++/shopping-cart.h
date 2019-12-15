#include <string>
#include <unordered_map>

using namespace std;

class ShoppingCart
{
  // quite of an improvement over the Java version
  unordered_map<string, int> contents;
public:
  void add_to_cart (string item) { contents[item]++; }
  void remove_from_cart (string item) { contents[item] = 0; }
  // to make this class useful anyhow
  int count (string item) { return contents[item]; }
  void check_out () { contents.clear (); }
};
