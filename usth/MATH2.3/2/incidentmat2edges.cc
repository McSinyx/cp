#include <iostream>
#include <map>
#include <utility>

using namespace std;

int
main ()
{
  int v, e, b;
  map<pair<int, int>, int> m;

  cin >> v >> e;
  for (int i = 0; i < v; ++i)
    {
      pair<int, int> p {-1, -1};

      for (int j = 0; j < e; ++j)
        {
          cin >> b;
          if (!b)
            continue;
          if (p.first < 0)
            p.first = p.second = j;
          else
            p.second = j;
        }
      m[p]++;
    }

  for (auto const& [p, c] : m)
    cout << p.first << " " << p.second << " " << c << endl;
}
