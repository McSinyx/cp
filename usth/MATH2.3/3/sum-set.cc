#include <iostream>
#include <vector>

using namespace std;

void
backtrack (vector<size_t>& big, vector<size_t>& smol, size_t& n, size_t index)
{
  size_t sum = 0;
  for (auto const& i : smol)
    sum += i;
  if (sum == n)
    {
      for (auto const& i : smol)
        cout << i << " ";
      cout << endl;
    }
  else
    for (size_t i = index; i < big.size (); ++i)
      if (sum + big[i] <= n)
        {
          smol.push_back (big[i]);
          backtrack (big, smol, n, i + 1);
          smol.pop_back ();
        }
}

int
main ()
{
  size_t n;
  size_t tmp;
  vector<size_t> s;

  cin >> n;
  for (size_t i = 0; i < n; ++i)
    {
      cin >> tmp;
      s.push_back (tmp);
    }

  vector<size_t> r;
  backtrack (s, r, n, 0);
}
