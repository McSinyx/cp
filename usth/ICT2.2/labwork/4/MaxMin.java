import java.util.ArrayList;
import java.util.Scanner;

import static java.util.Collections.min;
import static java.util.Collections.max;
import static java.util.stream.Collectors.toList;

class MaxMin
{
  public static void main(String... args)
  {
    var numbers = new ArrayList<Integer>();
    var scanner = new Scanner(System.in);
    while (scanner.hasNextInt())
      numbers.add(scanner.nextInt());
    System.out.printf("Min: %d\nMax: %d\n", min(numbers), max(numbers));
  }
}
