import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class Kary
{ 
  private static final char[] DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7',
                                        '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

  public static void main(String... args)
  { 
    int n = Integer.parseInt(args[0]);
    List<Character> result = new ArrayList<Character>();
    for (int k = Integer.parseInt(args[1]); n > 0; n /= k)
      result.add(DIGITS[n % k]);

    Collections.reverse(result);
    for (char d : result)
      System.out.print(d);
    System.out.println();
  }
}
