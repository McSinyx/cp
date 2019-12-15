public class Circle extends Point
{
  public double r;

  public Circle(double x, double y, double r)
  {
    super(x, y);
    this.r = r;
  }

  public double calArea() { return r * r * Math.PI; }
  public String getName() { return "Circle"; }
}
