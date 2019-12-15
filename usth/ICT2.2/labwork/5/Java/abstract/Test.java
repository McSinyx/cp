import static java.util.Arrays.asList;

class Test
{
  public static void main(String... args)
  {
    var array = asList(new Point(1.0, 2.0), new Circle(3.0, 4.0, 5.0),
                       new Cylinder(6.0, 7.0, 8.0, 9.0));
    array.forEach(System.out::println);
  }
}
