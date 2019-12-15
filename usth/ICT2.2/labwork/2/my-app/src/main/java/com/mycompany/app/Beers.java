package com.mycompany.app;

// Exercise 4
public class Beers
{
  public static void main(String... args)
  {
    for (int i = 9; i > 1; --i)
      System.out.printf(
        "%d bottles of beer we are going to drink, %d bottles of beer.\n"
        + "Now try to drink one, drink one,\n", i, i);
    System.out.print(
      "1 bottle of beer we are going to drink, 1 bottle of beer.\n"
      + "Now try to drink one, drink one,\n"
      + "Oh no, no bottles of beer to drink now.\n");
  }
}
