import java.util.Scanner;

class WordCount
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    int count = 0;
    while (scanner.hasNext())
      {
        scanner.next();
        count++;
      }
    System.out.println(count);
  }
}
