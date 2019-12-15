class Distance
{
  public static void main(String... args)
  {
    double x = Double.parseDouble(args[0]);
    double y = Double.parseDouble(args[1]);
    System.out.printf("The distance from (%g, %g) to origin is %g\n",
                      x, y, Math.sqrt(x*x + y*y));
  }
}
