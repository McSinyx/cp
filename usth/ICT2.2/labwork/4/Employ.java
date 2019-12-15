import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

class Employ
{
  private static Employee scan(Scanner s)
  {
    int ID = s.nextInt();
    s.nextLine();
    return new Employee(ID, s.nextLine(), s.nextLine(),
                        s.nextDouble(), s.nextDouble());
  }

  public static void main(String... args) throws FileNotFoundException
  {
    var stdin = new Scanner(System.in);
    var f = new File("employees.txt");
    var file = new Scanner(f);
    var employees = new ArrayList<Employee>();
    int n = stdin.nextInt();
    for (int i = 0; i < n; ++i)
      {
        employees.add(scan(stdin));
        employees.add(scan(file));
      }
    employees.forEach(System.out::println);
  }
}
