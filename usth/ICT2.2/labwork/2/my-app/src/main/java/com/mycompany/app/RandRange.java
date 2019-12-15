package com.mycompany.app;

import java.util.concurrent.ThreadLocalRandom;

// Exercise 3
class RandRange
{
  public static void main(String... args)
  {
    System.out.println(
      ThreadLocalRandom.current().nextInt(0, Integer.parseInt(args[0])));
  }
}
