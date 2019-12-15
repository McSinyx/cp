#include <string>

using namespace std;

class Automobile
{
  double fuel;
  double speed;
  string license;
public:
  Automobile (string, double, double);
  string get_license () { return license; }
  double get_fuel () { return fuel; }
  double get_speed () { return speed; }
  void set_license (string);
  void set_fuel (double);
  void set_speed (double);
  void accelerate (double);
  void decelerate (double);
};
