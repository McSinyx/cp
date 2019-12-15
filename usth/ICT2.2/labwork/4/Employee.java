public class Employee
{
  private int ID;
  private String name;
  private String dep;
  private double basic;
  private double extra;

  public Employee(int ID, String name, String dep, double basic, double extra)
  {
    this.ID = ID;
    this.name = name;
    this.dep = dep;
    this.basic = basic;
    this.extra = extra;
  }

  public int getID() { return ID; }
  public String getName() { return name; }
  public String getDep() { return dep; }
  public double getIncome() { return basic + extra*2.5; }

  public String toString()
  {
    return String.format("#%d %s [%s]: %g", ID, name, dep, getIncome());
  }
}
