public class Point extends Shape
{
  public double x;
  public double y;

  public Point(double x, double y)
  {
    this.x = x;
    this.y = y;
  }

  public String getName() { return "Point"; }
}
