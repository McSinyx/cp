import java.util.Scanner;

class Closest
{
  private static double x, y, z;

  private static double dist(double a, double b, double c)
  {
    double g = x - a;
    double h = y - b;
    double i = z - c;
    return g*g + h*h + i*i;
  }

  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    Double length = null;
    double a = 0.0, b = 0.0, c = 0.0;

    x = Double.parseDouble(args[0]);
    y = Double.parseDouble(args[1]);
    z = Double.parseDouble(args[2]);
    while (scanner.hasNextDouble())
      {
        double d = scanner.nextDouble();
        if (!scanner.hasNextDouble())
          break;
        double e = scanner.nextDouble();
        if (!scanner.hasNextDouble())
          break;
        double f = scanner.nextDouble();
        double len = dist(d, e, f);

        if (length == null || len < length)
          {
            length = len;
            a = d;
            b = e;
            c = f;
          }
      }
    System.out.println(a + " " + b + " " + c);
  }
}
