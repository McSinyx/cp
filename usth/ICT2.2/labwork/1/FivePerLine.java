class FivePerLine
{
  public static void main(String... args)
  {
    for (int i = 1000; i < 2000; ++i)
      if (i % 5 < 4)
        System.out.print(i + " ");
      else
        System.out.println(i);
  }
}
