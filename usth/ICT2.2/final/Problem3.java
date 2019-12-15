import java.util.ArrayList;
import java.util.Scanner;

class Problem3
{
  public static void main(String... args)
  {
    var scanner = new Scanner(System.in);
    System.out.println("Number of members:");
    int n = scanner.nextInt();

    var members = new ArrayList<Member>();
    for (int i = 0; i < n; ++i)
      {
        System.out.println("Member name: ");
        String name = scanner.next();
        System.out.println("Member joining time: ");
        String time = scanner.next();
        System.out.println("Member role number: ");
        int role = scanner.nextInt();
        members.add(new Member(name, time, role));
      }

    var reports = new ArrayList<Report>();
    for (var m : members)
      {
        System.out.println(m);
        System.out.println("Activity: ");
        String act = scanner.next();
        System.out.println("Rate: ");
        int rate = scanner.nextInt();
        reports.add(new Report(m.getName(), act, rate));
      }

    System.out.println("Members:");
    members.forEach(System.out::println);
    System.out.println("Activity reports:");
    reports.forEach(System.out::println);
  }
}
