#include <string>

using namespace std;

class Button
{
  bool state;
public:
  string label;
  string color;
  Button (string l, string c) : label {l}, color {c}, state {false} {}
  void depress () { state = true; }
  void undepress () { state = false; }
};
