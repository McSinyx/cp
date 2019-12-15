import java.util.Scanner;

class Problem1
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    for (int i = 1; i <= n; i += 2)
      System.out.println(i);
    if (n % 2 == 0)
      n--;
    System.out.println((n + 1) * (n + 1) / 4);
  }
}
