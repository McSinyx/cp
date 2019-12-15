public class Point implements Shape
{
  public double x;
  public double y;

  public Point(double x, double y)
  {
    this.x = x;
    this.y = y;
  }

  public double calArea() { return 0.0; }
  public double calVolume() { return 0.0; }
  public String getName() { return "Point"; }

  public String toString()
  {
    return String.format("%s of area %g and volume %g",
                         getName(), calArea(), calVolume());
  }
}
