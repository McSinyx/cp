#include <iostream>
#include <numeric>
#include <vector>

using namespace std;

int
main()
{
  int t;
  long n, m, q, x, y;

  cin >> t;
  while (t--)
    {
      cin >> n >> m >> q;
      vector<int> u (n), v (m);

      while (q--)
        {
          cin >> x >> y;
          u[x - 1] ^= 1;
          v[y - 1] ^= 1;
        }

      x = accumulate (u.begin(), u.end(), 0);
      y = accumulate (v.begin(), v.end(), 0);
      cout << x * (m - y) + (n - x) * y << endl;
    }

  return 0;
}
