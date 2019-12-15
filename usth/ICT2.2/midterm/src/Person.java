public class Person implements Comparable<Person>
{
  private String name;
  private Integer age;
  private Character gender;

  public Person(String name, Integer age, Character gender)
  {
    this.name = name;
    this.age = age;
    this.gender = gender;
  }

  public int compareTo(Person other)
  {
    return this.name.compareTo(other.name);
  }

  public String toString()
  {
    return String.format("%s (%d%c)", name, age, gender);
  }

  public String getName()
  {
    return name;
  }

  public Integer getAge()
  {
    return age;
  }
 
  public Character getGender()
  {
    return gender;
  }
}
