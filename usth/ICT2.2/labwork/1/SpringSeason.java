import java.time.LocalDate;
import java.time.DateTimeException;

class SpringSeason
{
  private static final LocalDate start = LocalDate.of(42, 3, 19);
  private static final LocalDate end = LocalDate.of(42, 6, 21);

  public static void main(String... args)
  {
    int m = Integer.parseInt(args[0]);
    int d = Integer.parseInt(args[1]);
    try
      {
        LocalDate query = LocalDate.of(42, m, d);
        // Yes, I'm sorry for leaving it here.
        // If only Java has the try-except-else like Python!
        System.out.println(query.isAfter(start) && query.isBefore(end));
      }
    catch (DateTimeException e)
      {
        System.out.println(false);
      }
  }
}
