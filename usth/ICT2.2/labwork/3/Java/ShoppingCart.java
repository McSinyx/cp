import java.util.ArrayList;
import java.util.List;

public class ShoppingCart
{
  private List<String> cartContents = new ArrayList<String>();

  public boolean addToCart(String content)
  {
    return cartContents.add(content);
  }

  public boolean removeFromCart(String content)
  {
    return cartContents.remove(content);
  }

  public void checkOut()
  {
    cartContents.clear();
  }

  public String toString()
  {
    return "Cart content(s): " + String.join(", ", cartContents);
  }
}
