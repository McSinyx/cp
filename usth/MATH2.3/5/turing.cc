#include <iostream>
#include <deque>
#include <tuple>
#include <unordered_map>

using namespace std;

int
main ()
{
  int n;
  unordered_map<int, unordered_map<int, tuple<int, int, int>>> tuples;
  cin >> n;
  while (n--)
    {
      int s, x, t, y, d;
      cin >> s >> x >> t >> y >> d;
      tuples[s][x] = {t, y, d};
    }

  deque<int> input;
  cin >> n;
  while (n--)
    {
      int i;
      cin >> i;
      input.push_back (i);
    }

  int o {0}, i {0}, s {0}, x, d;
  for (;;)
    {
      tie (s, x, d) = tuples[s][input[i - o]];
      if (!d)
        break;

      if (i < o)
        {
          input.push_front (x);
          o++;
        }
      else if (i - o == input.size ())
        input.push_back (x);
      else
        input[i - o] = x;

      if (d < 0)
        i--;
      else
        i++;
    }

  for (auto const& i : input)
    cout << i;
  cout << endl;
}
