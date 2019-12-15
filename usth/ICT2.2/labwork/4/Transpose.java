class Transpose
{
  public static void main(String... args)
  {
    int[][] m = {{7, 8, 9},
                 {4, 5, 6},
                 {1, 2, 3}};
    int n = 3;  // some sort of abstraction
    System.out.println("Original matrix:");
    for (int i = 0; i < n; ++i)
      System.out.printf("%d %d %d\n", m[i][0], m[i][1], m[i][2]);

    for (int i = 1; i < n; ++i)
      for (int j = 0; j < i; ++j)
        {
          m[i][j] ^= m[j][i];
          m[j][i] ^= m[i][j];
          m[i][j] ^= m[j][i];
        }
    System.out.println("Transposed matrix:");
    for (int i = 0; i < n; ++i)
      System.out.printf("%d %d %d\n", m[i][0], m[i][1], m[i][2]);
  }
}
