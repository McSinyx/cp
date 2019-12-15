public class Cow
{
  private String name;
  private String breed;
  private int age;

  public Cow(String name, String breed)
  {
    this(name, breed, 0);
  }

  public Cow(String name, String breed, int age)
  {
    this.name = name;
    this.breed = breed;
    setAge(age);
  }

  public static void moo()
  {
    System.out.println("Moo...!");
  }

  public int getAge()
  {
    return age;
  }

  public void setAge(int age)
  {
    if (age < 0)
      throw new IllegalArgumentException(
        "age must be nonnegative, instead got " + age);
    this.age = age;
  }
}
