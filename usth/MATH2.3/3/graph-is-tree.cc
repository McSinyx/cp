#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace std;

int
main ()
{
  size_t n;
  int b;
  unordered_map<size_t, unordered_set<size_t>> edges;

  int m = 0;
  cin >> n;
  for (size_t i = 0; i < n; ++i)
    for (size_t j = 0; j < n; ++j)
      {
        cin >> b;
        if (!b || i > j)
          continue;
        edges[i].insert (j);
        edges[j].insert (i);
        m++;
      }

  if (n - m - 1)
    {
      cout << "no" << endl;
      return 0;
    }

  unordered_set<size_t> s;
  int count = -1;
  for (auto const& [v, p] : edges)
    {
      if (s.count (v))
        continue;
      count++;
      vector<size_t> lifo {v};
      while (!lifo.empty ())
        {
          size_t u = lifo.back ();
          lifo.pop_back ();
          if (s.count (u))
            continue;
          s.insert (u);
          for (auto const& w : edges[u])
            if (!s.count (w))
              lifo.push_back (w);
        }
    }

  cout << (count ? "no" : "yes") << endl;
}
