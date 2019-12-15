// Immutable Point
public class Point
{
  private double x;
  private double y;

  public Point(double x, double y)
  {
    this.x = x;
    this.y = y;
  }

  public double getX()
  {
    return x;
  }

  public double getY()
  {
    return y;
  }

  public String toString()
  {
    return String.format("(%g, %g)", x, y);
  }

  public static Point add(Point a, Point b)
  {
    return new Point(a.getX() + b.getX(), a.getY() + b.getY());
  }

  public static Point subtract(Point a, Point b)
  {
    return new Point(a.getX() - b.getX(), a.getY() - b.getY());
  }

  public static double calDisEuclid(Point a, Point b)
  {
    var trans = Point.subtract(a, b);
    return Math.sqrt(trans.getX()*trans.getX() + trans.getY()*trans.getY());
  }
}
