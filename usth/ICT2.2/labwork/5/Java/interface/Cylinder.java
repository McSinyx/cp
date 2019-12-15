public class Cylinder extends Circle
{
  public double h;

  public Cylinder(double x, double y, double r, double h)
  {
    super(x, y, r);
    this.h = h;
  }

  public double calArea() { return super.calArea()*2.0 + r*h*Math.PI*2.0; }
  public double calVolume() { return super.calArea() * h; }
  public String getName() { return "Circle"; }
}
