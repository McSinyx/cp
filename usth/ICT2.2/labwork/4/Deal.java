import static java.util.Collections.shuffle;
import static java.util.stream.Collectors.toList;
import static java.util.stream.IntStream.range;

class Deal
{
  static final String[] suits = {"clubs", "diamonds", "hearts", "spades"};
  static final String[] ranks = {"Ace", "Two", "Three", "Four", "Five",
                                 "Six", "Seven", "Eight", "Nine", "Ten",
                                 "Jack", "Queen", "King"};

  public static void main(String... args)
  {
    var deck = range(0, 52).boxed().collect(toList());
    shuffle(deck);

    // I have no time handling exceptions.
    int n = Integer.parseInt(args[0]) % 52;
    while (n-- > 0)
      {
        int card = deck.get(n);
        int suit = card / 13;
        int rank = card % 13;
        System.out.printf("%s of %s\n", ranks[rank], suits[suit]);
      }
  }
}
