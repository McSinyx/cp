import java.util.List;
import java.util.Comparator;

import static java.util.Collections.swap;

public class Heap<T>
{
  private List<T> list;
  private Comparator<T> cmp;
  private int size;

  public int getSize()
  {
    return size;
  }

  public int getLength()
  {
    return list.size();
  }

  public T get(int i)
  {
    return list.get(i);
  }

  public void heapify(int i)
  {
    int right = i + 1 << 1;
    int left = right - 1;
    int largest = i;

    if (left < size && cmp.compare(get(left), get(largest)) > 0)
      largest = left;
    if (right < size && cmp.compare(get(right), get(largest)) > 0)
      largest = right;
    if (largest != i)
      {
        swap(list, i, largest);
        heapify(largest);
      }
  }

  public Heap(List<T> a, Comparator<T> c)
  {
    list = a;
    size = a.size();
    cmp = c;
    for (int i = size >> 1; i-- > 0;)
      heapify(i);
  }

  public T pop() throws RuntimeException
  {
    if (size < 1)
      throw new RuntimeException("heap underflow");
    swap(list, 0, --size);
    heapify(0);
    return get(size);
  }
}
