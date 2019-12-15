import java.util.concurrent.ThreadLocalRandom;

class SumOfTwoDice
{
  public static void main(String... args)
  {
    int x = ThreadLocalRandom.current().nextInt(1, 7);
    System.out.println("First roll: " + x);
    int y = ThreadLocalRandom.current().nextInt(1, 7);
    System.out.println("Second roll: " + y);
    System.out.println("Sum: " + (x + y));
  }
}
