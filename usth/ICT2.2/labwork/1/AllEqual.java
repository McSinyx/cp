import java.util.Arrays;

class AllEqual
{
  public static void main(String... args)
  {
    String first = args[0];
    System.out.println(Arrays.stream(args).allMatch(a -> (a.equals(first))));
  }
}
