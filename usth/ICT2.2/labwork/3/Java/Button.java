public class Button
{
  private String label;
  private String color;
  private boolean state;

  public Button(String label, String color)
  {
    this.label = label;
    this.color = color;
    this.state = false;
  }

  public String toString()
  {
    return String.format("<button %s with color %s and state %s>",
                         label, color, state);
  }

  // To be honest these getters and setters are really redundant in this case
  public String getLabel()
  {
    return label;
  }

  public String getColor()
  {
    return color;
  }

  public void setLabel(String label)
  {
    this.label = label;
  }

  public void setColor(String color)
  {
    this.color = color;
  }

  public void dePress()
  {
    this.state = true;
  }

  public void unDepress()
  {
    this.state = false;
  }
}
