public class Member
{
  public static final String[] ROLES = {"leader", "club coordinator",
                                        "keynote speaker of code sharing",
                                        "product programmer"};

  private String name;
  private String time;
  private int role;

  public String getName()
  {
    return name;
  }

  public String getTime()
  {
    return time;
  }

  public int getRole()
  {
    return role;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  public void setTime(String time)
  {
    this.time = time;
  }
  
  public void setRole(int role) throws IllegalArgumentException
  {
    if (role < 0 || role > 3)
      throw new IllegalArgumentException("invalid role number: " + role);
    this.role = role;
  }

  public Member(String name, String time, int role)
  {
    setName(name);
    setTime(time);
    setRole(role);
  }

  public String toString()
  {
    return String.format("%s (%s), from %s", name, ROLES[role], time);
  }
}
