import java.util.List;
import java.util.Comparator;

import static java.util.Collections.swap;

public class Sort
{
  public static <T> void selection(List<T> list, Comparator<T> comparator)
  {
    int i, j, m, n = list.size();
    for (i = 0; i < n; ++i)
      {
        for (m = j = i; j < n; ++j)
          if (comparator.compare(list.get(j), list.get(m)) < 0)
            m = j;
        swap(list, i, m);
      }
  }

  public static <T extends Comparable<? super T>> void selection(List<T> list)
  {
    selection(list, new Compare<T>());
  }

  public static <T> void bubble(List<T> list, Comparator<T> comparator)
  {
    for (int n = list.size(), m = 0; n > 1; n = m, m = 0)
      for (int i = 1; i < n; ++i)
        if (comparator.compare(list.get(i), list.get(i - 1)) < 0)
          swap(list, m = i, i - 1);
  }

  public static <T extends Comparable<? super T>> void bubble(List<T> list)
  {
    bubble(list, new Compare<T>());
  }

  public static <T> void heap(List<T> list, Comparator<T> comparator)
  {
    var heap = new Heap<T>(list, comparator);
    for (int i = 1; i < list.size(); ++i)
      heap.pop();
  }

  public static <T extends Comparable<? super T>> void heap(List<T> list)
  {
    heap(list, new Compare<T>());
  }
}
