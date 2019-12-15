package com.mycompany.app;

// Exercise 7
public class IsLeapYear
{
  public static void main(String... args)
  {
    int n = Integer.parseInt(args[0]);
    if (n % 4 == 0 && n % 100 != 0 || n % 400 == 0)
      System.out.printf("%d is a leap year\n", n);
    else
      System.out.printf("%d is not a leap year\n", n);
  }
}
