import java.util.Scanner;

class Centriod
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    double m = 0.0, x = 0.0, y = 0.0;

    while (scanner.hasNextDouble())
      {
        double n = scanner.nextDouble();
        if (!scanner.hasNextDouble())
          break;
        double s = scanner.nextDouble();
        if (!scanner.hasNextDouble())
          break;
        double i = scanner.nextDouble();

        m += n;
        x += n * s;
        y += n * i;
      }
    System.out.println(m + " " + x/m + " " + y/m);
  }
}
