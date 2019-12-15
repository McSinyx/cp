import java.util.List;
import java.util.Comparator;

public class Search
{
  public static final int NOT_FOUND = -1;

  public static int linear(List list, Object key)
  {
    for (int i = 0; i < list.size(); ++i)
      if (key == null ? list.get(i) == null : key.equals(list.get(i)))
        return i;
    return NOT_FOUND;
  }

  private static <T>
  int binary(List<? extends Comparable<? super T>> list, T key,
             int low, int high)
  {
    if (high < low)
      return NOT_FOUND;
    var mid = (low + high) / 2;
    var cmp = list.get(mid).compareTo(key);
    if (cmp < 0)
      return binary(list, key, mid + 1, high);
    if (cmp > 0)
      return binary(list, key, low, mid - 1);
    return mid;
  }

  public static <T>
  int binary(List<? extends Comparable<? super T>> list, T key)
  {
    return binary(list, key, 0, list.size());
  }

  private static <T>
  int binary(List<? extends T> list, T key, Comparator<? super T> c,
             int low, int high)
  {
    if (high < low)
      return NOT_FOUND;
    var mid = (low + high) / 2;
    var cmp = c.compare(list.get(mid), key);
    if (cmp < 0)
      return binary(list, key, c, mid + 1, high);
    if (cmp > 0)
      return binary(list, key, c, low, mid - 1);
    return mid;
  }

  public static <T>
  int binary(List<? extends T> list, T key, Comparator<? super T> c)
  {
    return binary(list, key, c, 0, list.size());
  }
}
