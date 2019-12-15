#include <string>

using namespace std;

class Cow
{
  // The reason these have private access
  // is that their no way a cow's name and breed can be changed.
  string name;
  string breed;
public:
  unsigned age;

  Cow (string n, string b, unsigned a) : name {n}, breed {b}, age {a} {}
  Cow (string n, string b) : name {n}, breed {b}, age {0} {}
  void moo ();
};
