import java.util.regex.Pattern;

public class NameCard
{
  private static final Pattern namePattern = Pattern.compile("[ A-Za-z]+");
  private static final Pattern phonePattern = Pattern.compile("[-0-9]*");
  // I have not learnt regex properly
  private static final Pattern emailPattern = Pattern.compile(
    "(\\w+)(\\.|_)?(\\w*)@(\\w+)(\\.(\\w+))+");

  private String name;
  private String phone;
  private String email;

  public String getName()
  {
    return name;
  }

  public String getPhone()
  {
    return phone;
  }

  public String getEmail()
  {
    return email;
  }

  public void setName(String name)
  {
    if (!namePattern.matcher(name).matches())
      throw new IllegalArgumentException("invalid name: " + name);
    this.name = name;
  }

  public void setPhone(String phone)
  {
    if (!phonePattern.matcher(phone).matches())
      throw new IllegalArgumentException("invalid phone number: " + phone);
    this.phone = phone;
  }

  public void setEmail(String email)
  {
    if (!emailPattern.matcher(email).matches())
      throw new IllegalArgumentException("invalid email: " + email);
    this.email = email;
  }

  public NameCard(String name)
  {
    this(name, "", "");
  }

  public NameCard(String name, String phone)
  {
    this(name, phone, "");
  }

  public NameCard(String name, String phone, String email)
  {
    setName(name);
    setPhone(phone);
    setEmail(email);
  }
}
