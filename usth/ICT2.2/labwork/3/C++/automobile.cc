#include <regex>
#include <stdexcept>
#include <string>

#include "automobile.h"

using namespace std;

const regex license_pattern ("[0-9A-Z]+");

void
Automobile::set_license (string s)
{
  smatch m;
  if (!regex_match (s, m, license_pattern))
    throw invalid_argument{"invalid license plate"};
  license = s;
}

void
Automobile::set_fuel (double x)
{
  if (x < 0)
    throw invalid_argument{"negative fuel"};
  fuel = x;
}

void
Automobile::set_speed (double x)
{
  speed = (x < 0) ? 0 : x;
}

Automobile::Automobile (string l, double f, double s)
{
  set_license (l);
  set_fuel (f);
  set_speed (s);
}

void
Automobile::accelerate (double v)
{
  if (v < 0)
    throw invalid_argument{"negative acceleration"};
  if (fuel)
    set_speed (speed + v);
}

void
Automobile::decelerate (double v)
{
  if (v < 0)
    throw invalid_argument{"negative deceleration"};
  set_speed (speed - v);
}
