#include <iostream>

using namespace std;

enum class Color { red, blue, green };
enum class TraficLight { green, yellow, red };

TraficLight& operator++ (TraficLight& t)
{
  switch (t)
    {
    case TraficLight::green:
      return t = TraficLight::yellow;
    case TraficLight::yellow:
      return t = TraficLight::red;
    case TraficLight::red:
      return t = TraficLight::green;
    }
}

int
main ()
{
  Color col = Color::red;
  TraficLight light = TraficLight::red;
  TraficLight nxt = ++light;
  // ugh now we test if it compiles? just wanna build some muscle memory
}
