import java.util.regex.Pattern;

class Automobile
{
  private static final Pattern licensePattern = Pattern.compile("[0-9A-Z]+");
  private double fuel;
  private double speed;
  private String license;

  public double getFuel()
  {
    return fuel;
  }

  public double getSpeed()
  {
    return speed;
  }

  public String getLicense()
  {
    return license;
  }

  public void setFuel(double fuel)
  {
    if (fuel < 0)
      throw new IllegalArgumentException(
        "fuel must be nonnegative, instead got " + fuel);
    this.fuel = fuel;
  }

  public void setSpeed(double speed)
  {
    this.speed = Math.max(0, speed);
  }

  public void setLicense(String license)
  {
    if (!licensePattern.matcher(license).matches())
      throw new IllegalArgumentException("invalid license: " + license);
    this.license = license;
  }

  public Automobile(double f, double s, String l)
  {
    setFuel(f);
    setSpeed(s);
    setLicense(l);
  }

  public void accelerate(double v)
  {
    if (v < 0)
      throw new IllegalArgumentException(
        "acceleration must be nonnegative, instead got " + v);
    if (fuel > 0)
      setSpeed(speed + v);
  }

  public void decelerate(double v)
  {
    if (v < 0)
      throw new IllegalArgumentException(
        "deceleration must be nonnegative, instead got " + v);
    setSpeed(speed - v);
  }
}
