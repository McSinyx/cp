class ButtonTest
{
  public static void main(String... args)
  {
    Button button = new Button("foo", "bar");
    System.out.println(button);
    button.setLabel("fu");
    button.setColor("baz");
    button.dePress();
    System.out.println(button);
  }
}
