package com.mycompany.app;

// Exercise 6
public class Quadratic
{
  public static void main(String... args)
  {
    double a = Double.parseDouble(args[0]);
    double b = Double.parseDouble(args[1]);
    double c = Double.parseDouble(args[2]);
    // assume ax^2 + bx + c = 0 is a valid quadratic equation
    double d = b*b - a*c*4;
    if (d < 0)
      {
        System.out.printf("%f + %fj\n", -b/a/2, Math.sqrt(-d)/a/2);
        System.out.printf("%f + %fj\n", -b/a/2, -Math.sqrt(-d)/a/2);
      }
    else
      {
        System.out.println(-b/a/2 + Math.sqrt(d)/a/2);
        System.out.println(-b/a/2 - Math.sqrt(d)/a/2);
      }
  }
}
