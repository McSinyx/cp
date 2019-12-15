import java.util.ArrayList;
import java.util.Scanner;

class Stats
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    var numbers = new ArrayList<Double>();
    for (int i = 0; i < n; ++i)
      numbers.add(scanner.nextDouble());

    double m = numbers.stream().mapToDouble(Double::doubleValue).sum() / n;
    double s = Math.sqrt(numbers.stream()
                         .mapToDouble(x -> Math.pow(x - m, 2)).sum() / n);
    System.out.printf("Mean: %f\nStandard deviation: %f\n", m, s);
  }
}
