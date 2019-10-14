#include <algorithm>
#include <iostream>
#include <unordered_map>

using namespace std;

int
main()
{
  int t, n, i;
  long a;

  cin >> t;
  while (t--)
    {
      int star = 0;
      unordered_map<long, int> m;

      cin >> n;
      while (n--)
        {
          cin >> a;
          star = max (m[a], star);

          for (i = 1; i * i < a; ++i)
            if (a % i == 0)
              {
                m[i]++;
                m[a / i]++;
              }
          if (i * i == a)
            m[i]++;
        }

      cout << star << endl;
    }

  return 0;
}
