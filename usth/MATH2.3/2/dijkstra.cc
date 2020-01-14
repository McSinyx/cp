#include <iostream>
#include <deque>
#include <queue>
#include <unordered_map>
#include <vector>

#define ENCODE(w, c, p) (((w) << 20) + ((c) << 10) + (p))
#define WEIGHT(x) ((x) >> 20)
#define CUR(x) ((x) >> 10 & 1023)
#define PREV(x) ((x) & 1023)

using namespace std;

int
main ()
{
  size_t n, a, b, w, s, e;
  unordered_map<size_t, unordered_map<size_t, size_t>> edges;

  cin >> n >> s >> e;
  for (size_t i = 0; i < n; ++i)
    {
      cin >> a >> b >> w;
      edges[a][b] = edges[b][a] = w;
    }

  unordered_map<size_t, size_t> prev;
  priority_queue<size_t, vector<size_t>, greater<size_t>> pq;
  pq.push (ENCODE (0, s, s));

  while (!pq.empty ())
    {
      size_t p = pq.top ();
      a = PREV (p);
      b = CUR (p);
      w = WEIGHT (p);
      if (!prev[b])
        prev[b] = a;
      if (b == e)
        break;
      pq.pop ();

      for (auto const& [i, v] : edges[b])
        if (!prev[i])
          pq.push (ENCODE (w + v, i, b));
    }

  deque<size_t> d;
  for (; e != s; e = prev[e])
    d.push_front (e);
  d.push_front (e);
  for (auto const& i : d)
    cout << i << " ";
  cout << "(length of " << w << ")" << endl;
}
