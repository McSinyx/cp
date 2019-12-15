import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Stream;

import static java.util.Collections.binarySearch;
import static java.util.stream.Collectors.toList;

class DiscreteDistro
{
  public static void main(String... args)
  {
    var numbers = Stream.of(args).mapToInt(Integer::parseInt)
                                 .boxed().collect(toList());
    int n = numbers.size();
    for (int i = 1; i < n; ++i)
      numbers.set(i, numbers.get(i) + numbers.get(i - 1));

    int x = ThreadLocalRandom.current().nextInt(0, numbers.get(n - 1));
    int i = binarySearch(numbers, x) + 1;
    System.out.println(numbers);
    System.out.println(x);
    System.out.println((i < 0) ? -i : i);
  }
}
