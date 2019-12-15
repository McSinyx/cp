class ShoppingCartTest
{
  public static void main(String... args)
  {
    ShoppingCart cart = new ShoppingCart();
    System.out.println(cart);
    cart.addToCart("foo");
    cart.addToCart("bar");
    cart.addToCart("baz");
    System.out.println(cart);
    cart.removeFromCart("bar");
    System.out.println(cart);
    cart.checkOut();
    System.out.println(cart);
  }
}
