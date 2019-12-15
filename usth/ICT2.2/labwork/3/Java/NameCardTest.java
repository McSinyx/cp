class NameCardTest
{
  public static void main(String... args)
  {
    NameCard card = new NameCard("Foobar Baz", "420-69", "foo@bar.baz");
    System.out.printf("Name: %s\nPhone: %s\nEmail: %s\n",
                      card.getName(), card.getPhone(), card.getEmail());
  }
}
