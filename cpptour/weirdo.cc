#include <iostream>
#include <set>
#include <stdexcept>
#include <string>
#include <unordered_map>

using namespace std;

typedef unordered_map<char, size_t> charmap;
typedef set<char> charset;

constexpr double INF = 1e7;
const charset VOWELS {'a', 'e', 'i', 'o', 'u'};

inline size_t
sqr (size_t i)
{
  return i * i;
}

bool
isvowel (const string& s, size_t i)
{
  try { return VOWELS.count (s.at (i)); }
  catch (out_of_range const& e) { return true; }
}

void
update (const string& s, charmap& x, charmap& f)
{
  charset b;
  for (const auto& c : s)
    {
      f[c]++;
      b.insert (c);
    }
  for (const auto& c : b)
    x[c]++;
}

int
main ()
{
  size_t t, l;
  string s;

  cin >> t;
  while (t--)
    {
      charmap xa, fa, xb, fb;
      cin >> l;
      while (l--)
        {
          cin >> s;
          size_t i = s.size ();
          bool a = true;

          while (i--)
            if (isvowel (s, i - 1) + isvowel (s, i) + isvowel (s, i + 1) < 2)
              {
                update (s, xb, fb);
                a = false;
                break;
              }
          if (a)
            update (s, xa, fa);
        }

      double sc = 1.0;
      for (const auto& p : xa)
        sc *= p.second;
      for (const auto& p : fa)
        sc /= sqr (p.second);
      for (const auto& p : xb)
        sc /= p.second;
      for (const auto& p : fb)
        sc *= sqr (p.second);
      if (sc > INF)
        cout << "Infinity" << endl;
      else
        cout << sc << endl;
    }
}
