#include <algorithm>
#include <iostream>
#include <map>
#include <string>
#include <vector>

using namespace std;

int
main()
{
  int k, total_profit {0};
  string movies {"ABCD"};
  vector<int> showtimes {3, 6, 9, 12};
  vector<int> prices {25, 50, 75, 100};

  cin >> k;
  while (k--)
    {
      map<char, map<int, int>> requests;
      int n, t, profit {-400};
      char m;

      cin >> n;
      while (n--)
        {
          cin >> m >> t;
          requests[m][t]++;
        }

      for (int i = 0; i < 24; ++i)
        {
          for (int j = 0; j < 24; ++j)
            {
              vector<int> tickets {requests[movies[0]][showtimes[0]],
                                   requests[movies[1]][showtimes[1]],
                                   requests[movies[2]][showtimes[2]],
                                   requests[movies[3]][showtimes[3]]};
              int p {0};

              sort (tickets.begin(), tickets.end());
              for (int l = 0; l < 4; ++l)
                p += tickets[l] ? tickets[l]*prices[l] : -100;
              profit = max (p, profit);
              next_permutation (showtimes.begin(), showtimes.end());
            }
          next_permutation (movies.begin(), movies.end());
        }

      cout << profit << endl;
      total_profit += profit;
    }
  cout << total_profit << endl;
}
