class Hellos
{
  private static final String[] TH = {"th", "st", "nd", "rd", "th",
                                      "th", "th", "th", "th", "th"};

  public static void main(String... args)
  {
    int n = Integer.parseInt(args[0]);
    for (int i = 1; i <= n; ++i)
      // Before one says this defeat the purpose of the section,
      // the tertiary operator IS conditional.
      System.out.println(i + TH[i % 100 / 10 == 1 ? 7 : i % 10] + " Hello");
  }
}
