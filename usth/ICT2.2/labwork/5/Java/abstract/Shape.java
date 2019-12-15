public abstract class Shape
{
  public double calArea() { return 0.0; }
  public double calVolume() { return 0.0; }
  public abstract String getName();

  public String toString()
  {
    return String.format("%s of area %g and volume %g",
                         getName(), calArea(), calVolume());
  }
}
