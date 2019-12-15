package com.mycompany.app;

import java.util.Arrays;

// Exercise 8
public class MeanSTD
{
  public static void main(String... args)
  {
    double n = args.length;
    double m = Arrays.stream(args).mapToDouble(Double::parseDouble).sum() / n;
    double s = Math.sqrt(
      Arrays.stream(args)
      .mapToDouble(x -> Math.pow(Double.parseDouble(x) - m, 2)).sum() / n);
    System.out.printf("Mean: %f\nStandard deviation: %f\n", m, s);
  }
}
