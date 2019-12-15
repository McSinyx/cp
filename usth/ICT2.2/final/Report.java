public class Report
{
  String name;
  String activity;
  int rate;

  public Report(String name, String act, int rate)
  {
    this.name = name;
    this.activity = act;
    this.rate = rate;
  }

  public String toString()
  {
    return String.format("%s: %s: %s", name, activity, rate);
  }
}
