#include <iostream>
#include <unordered_map>

using namespace std;

void
dfs (unordered_map<size_t, unordered_map<size_t, int>>& graph, 
     unordered_map<size_t, int>& been, size_t current)
{
  been[current] = 1;
  for (auto const& [i, b] : graph[current])
    if (b > 0)
      if (been[i])
        graph[current][i] = graph[i][current] = 0;
      else
        {
          graph[current][i] = graph[i][current] = -1;
          dfs (graph, been, i);
        }
}

int
main ()
{
  size_t n;
  unordered_map<size_t, unordered_map<size_t, int>> edges;

  cin >> n;
  for (size_t i = 0; i < n; ++i)
    for (size_t j = 0; j < n; ++j)
      {
        cin >> edges[i][j];
        edges[j][i] = edges[i][j];
      }

  unordered_map<size_t, unordered_map<size_t, int>> st;
  unordered_map<size_t, int> been;
  dfs (edges, been, 0);

  for (auto const& [i, m] : edges)
    for (auto const& [j, b] : m)
      if (b && i <= j)
        cout << i << " " << j << endl;
}
