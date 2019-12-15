class CowTest   // there's no reason to import a test what-so-ever
{
  public static void main(String... args)
  {
    Cow cow = new Cow("foo", "bar", 7);
    cow.setAge(-4);
    cow.moo();
  }
}
