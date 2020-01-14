#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace std;

int
main ()
{
  size_t n, a, b;
  unordered_map<size_t, unordered_set<size_t>> edges;

  cin >> n;
  for (size_t i = 0; i < n; ++i)
    {
      cin >> a >> b;
      edges[a].insert (b);
      edges[b].insert (a);
    }

  unordered_set<size_t> s;
  size_t count = 0;
  for (auto const& [v, p] : edges)
    {
      if (s.count (v))
        continue;
      count++;
      vector<size_t> fifo {v};
      while (!fifo.empty ())
        {
          size_t u = fifo.back ();
          fifo.pop_back ();
          if (s.count (u))
            continue;
          s.insert (u);
          for (auto const& w : edges[u])
            if (!s.count (w))
              fifo.push_back (w);
        }
    }

  cout << count << endl;
}
