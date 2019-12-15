import java.util.Scanner;

class LongestRun
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    Integer number = null;
    Integer length = null;
    Integer n = null, len = null;

    while (scanner.hasNextInt())
      {
        Integer i = scanner.nextInt();
        if (i == n)
          {
            len++;
            continue;
          }
        if (length == null || len > length)
          {
            number = n;
            length = len;
          }
        n = i;
        len = 1;
      }
    System.out.printf("Longest run: %d consecutive %d\n", number, length);
  }
}
