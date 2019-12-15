import java.util.Scanner;

class Problem2
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    System.out.println(
        "Please enter two numbers which are the coordinate of one point:");
    var a = new Point(scanner.nextDouble(), scanner.nextDouble());
    System.out.println(
        "Please enter two numbers which are the coordinate of another point:");
    var b = new Point(scanner.nextDouble(), scanner.nextDouble());

    System.out.printf("First point: %s\nSecond point: %s\n", a, b);
    // Vector would make a better name than Point
    System.out.printf("Their sum: %s\nTheir difference: %s\n",
                      Point.add(a, b), Point.subtract(a, b));
    System.out.printf("The Euclidean distance between the two points: %s\n",
                      Point.calDisEuclid(a, b));
  }
}
