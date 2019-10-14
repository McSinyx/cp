#include <iostream>
#include <vector>

using namespace std;

int
main()
{
  int t, n;
  long k;

  cin >> t;
  while (t--)
    {
      cin >> n >> k;
      long d = k / n, m = k % n;
      vector<long> a (n);
      for (int i = 0; i < n; ++i)
        cin >> a[i];

      for (int i = 0; i < n / 2; ++i)
        {
          switch ((d + (m > i)) % 3)
            {
            case 1:
              cout << (a[i] ^ a[n - i - 1]);
              break;
            case 2:
              cout << a[n - i - 1];
              break;
            default:
              cout << a[i];
            }
          cout << ' ';
        }

      if (n % 2)
        cout << ((d + (m > n >> 1)) ? 0 : a[n >> 1]) << ' ';

      for (int i = n - (n >> 1); i < n; ++i)
        {
          switch ((d + (m > i)) % 3)
            {
            case 1:
              cout << a[n - i - 1];
              break;
            case 2:
              cout << (a[i] ^ a[n - i - 1]);
              break;
            default:
              cout << a[i];
            }
          cout << ((i + 1 == n) ? '\n' : ' ');
        }
    }

  return 0;
}
