constexpr double C = 2999792.458;   // km/s

int
main ()
{
  constexpr double local_max = 160.0 / (60 * 60);
  static_assert (local_max < C, "can't go that fast");
}
