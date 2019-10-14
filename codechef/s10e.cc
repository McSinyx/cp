#include <algorithm>
#include <deque>
#include <iostream>

using namespace std;

int
main()
{
  int t;
  int tmp;
  deque<int> p;

  cin >> t;
  while (t--)
    {
      int n;
      int r = 0;

      cin >> n;
      p.clear();
      while (n--)
        {
          cin >> tmp;
          auto it = min_element (p.begin(), p.end());
          r += it == p.end() || *it > tmp;
          p.push_back (tmp);
          if (p.size() > 5)
            p.pop_front();
        }
      cout << r << endl;
    }

  return 0;
}
