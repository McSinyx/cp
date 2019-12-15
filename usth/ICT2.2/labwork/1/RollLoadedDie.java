import java.util.concurrent.ThreadLocalRandom;

class RollLoadedDie
{
  public static void main(String... args)
  {
    int x = ThreadLocalRandom.current().nextInt(1, 9);
    System.out.println((x < 6) ? x : 6);
  }
}
