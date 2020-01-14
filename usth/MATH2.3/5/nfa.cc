#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

bool
recognize (unordered_map<int, unordered_map<int, vector<int>>>& f,
           unordered_map<int, bool>& F, string& s, int i, int r)
{
  if (i >= s.size ())
    return F[r];
  for (auto const& t : f[r][s[i] - '0'])
    if (recognize (f, F, s, i + 1, t))
      return true;
  return false;
}

int
main ()
{
  int n;
  unordered_map<int, unordered_map<int, vector<int>>> f;
  cin >> n;
  while (n--)
    {
      int s, i, r;
      cin >> s >> i >> r;
      f[s][i].push_back (r);
    }

  unordered_map<int, bool> F;
  cin >> n;
  while (n--)
    {
      int s;
      cin >> s;
      F[s] = true;
    }

  string s;
  cin >> s;
  cout << (recognize (f, F, s, 0, 0) ? "yes" : "no") << endl;
}
