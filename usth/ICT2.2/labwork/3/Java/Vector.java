public class Vector
{
  // There's nothing to validate
  public int x;
  public int y;

  public Vector()
  {
    this(0, 0);
  }

  public Vector(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  public String toString()
  {
    // I feel bad writing this
    return "(" + x + ", " + y + ")";
  }

  public Vector add(Vector other)
  {
    return new Vector(this.x + other.x, this.y + other.y);
  }

  public Vector subtract(Vector other)
  {
    return new Vector(this.x - other.x, this.y - other.y);
  }

  public Vector multiply(Vector other)
  {
    // instruction unclear, applying element-wise multiplication
    return new Vector(this.x * other.x, this.y * other.y);
  }
}
