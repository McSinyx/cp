class Binary
{
  public static void main(String... args)
  {
    int n = Integer.parseInt(args[0]);
    String s = "";
    while (n > 0)
      {
        s = (n % 2) + s;
        n >>= 1;
      }
    System.out.println(s);
  }
}
