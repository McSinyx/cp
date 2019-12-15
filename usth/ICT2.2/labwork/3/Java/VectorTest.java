class VectorTest
{
  public static void main(String... args)
  {
    Vector u = new Vector(4, 20);
    Vector v = new Vector(6, 9);
    System.out.printf("u = %s\nv = %s\nu + v = %s\nu - v = %s\nu * v = %s\n",
                      u, v, u.add(v), u.subtract(v), u.multiply(v));
  }
}
