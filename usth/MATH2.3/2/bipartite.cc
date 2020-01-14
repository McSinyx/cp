#include <iostream>
#include <queue>
#include <unordered_map>
#include <set>

using namespace std;

int
main ()
{
  unordered_map<size_t, unordered_map<size_t, size_t>> adj;
  size_t n, u, v;
  cin >> n;
  while (n--)
    {
      cin >> u >> v;
      adj[u][v]++;
      adj[v][u]++;
    }

  queue<size_t> q;
  set<size_t> one, another;
  q.push (u);
  one.insert (u);

  while (!q.empty ())
    {
      u = q.front ();
      q.pop ();
      if (adj[u][u])
        {
          cout << "no" << endl;
          return 0;
        }
      for (auto const& [v, b] : adj[u])
        {
          if (!b)
            continue;
          if (one.count (v) && one.count (u)
              || another.count (v) && another.count (u))
            {
              cout << "no" << endl;
              return 0;
            }
          if (one.count (v) || another.count (v))
            continue;
          q.push (v);
          if (one.count (u))
            another.insert (v);
          else
            one.insert (v);
        }
    }
  cout << "yes" << endl;
}
