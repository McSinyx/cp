class FunctionGrowth
{
  public static void main(String... args)
  {
    System.out.println("ln n\tn\tn ln n\tn^2\tn^3\t2^n");
    for (long n = 16; n < 3005; n <<= 1)
      System.out.printf("%g\t%d\t%g\t%d\t%d\t%g\n", Math.log(n), n,
                        n * Math.log(n), n*n, n*n*n, Math.pow(2, n));
  }
}
