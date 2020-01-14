#include <iostream>
#include <string>
#include <unordered_map>

using namespace std;

int
main ()
{
  int n;
  cin >> n;

  unordered_map<char, unordered_map<int, char>> automata;
  unordered_map<char, int> finals;
  for (int i = 0; i < n; ++i)
    {
      char c;
      string s, t;
      cin >> c >> t >> s;
      if (s == "$")
        finals[c] = 1;
      else
        automata[c][s[0] - '0'] =  (s.length () == 1) ? '$' : s[1];
    }

  cout << automata.size () << endl;
  for (auto& [c, m] : automata)
    cout << c << '\t' << m[0] << '\t' << m[1] << '\t'  << finals[c] << endl;
}
