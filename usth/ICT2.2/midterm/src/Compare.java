import java.util.Comparator;

public class Compare<T extends Comparable<? super T>> implements Comparator<T>
{
  public int compare(T a, T b)
  {
    return a.compareTo(b);
  }
}
