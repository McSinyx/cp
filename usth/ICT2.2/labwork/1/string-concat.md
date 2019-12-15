# String Concatenation

To quote the [official Java documentation](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html):

> The Java language provides special support for the string concatenation
> operator (`+`), and for conversion of other objects to strings.  [...]
> String conversions are implemented through the method `toString`, defined
> by Object and inherited by all classes in Java.

Thus the numbers (e.g. 2, 2 + 3 = 5) are converted to their strings
representations ("2", "5") and concatenated to the string.  Since `+` is
operated from left to right,

    2 + 3 + "bc" = 5 + "bc" = "5" + "bc" = "5bc"
    "bc" + 2 + 3 = "bc" + "2" + 3 = "bc2" + 3 = "bc2" + "3" = "bc23"
