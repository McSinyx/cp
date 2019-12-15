class SumOfSines
{
  public static void main(String... args)
  {
    double t = Double.parseDouble(args[0]);
    System.out.printf("sin2t + sin3t = %g", Math.sin(t * 2) + Math.sin (t * 3));
  }
}
