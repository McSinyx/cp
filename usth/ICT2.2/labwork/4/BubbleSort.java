import java.util.ArrayList;
import java.util.Scanner;

import static java.util.Collections.swap;

class Stats
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    var numbers = new ArrayList<Double>();
    for (int i = 0; i < n; ++i)
      numbers.add(scanner.nextDouble());
    for (int m = 0; n > 1; n = m, m = 0)
      for (int i = 1; i < n; ++i)
        if (numbers.get(i).compareTo(numbers.get(i - 1)) < 0)
          swap(numbers, m = i, i - 1);
    System.out.println(numbers);
  }
}
