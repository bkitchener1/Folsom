class CartItem < PageObject

  @cart_item_sku= WebElement.new(:class => 'MyCart-product-name')
  @cart_item_text = WebElement.new(:class => 'MyCart-product-text')
  @cart_item_manu = WebElement.new(:class => 'MyCart-product-manufacturer')
  @cart_item_price = WebElement.new(:class => 'MyCart-product-price')
  @cart_item_qty = WebElement.new(:class => 'MyCart-product-quantity')
  @cart_item_name = WebElement.new(".MyCart-product-name")

  # Returns only the price amount as a float
  def get_item_price_amount
    @cart_item_price.text.sub('$', '').to_f
  end

  # Returns only the price amount as an int
  def get_item_qty_amount
    @cart_item_qty.text.gsub('Quantity: ', '').gsub(',', '').to_i
  end
end

class ShoppingCart < PageObject
  @cart = WebElement.new(:id => 'header-cart')
  # @cart_qty) {cart_element.span_element(:class => 'u-dot--red')}
  @cart_div = WebElement.new(:class => 'MyCart')
  @cart_qty = WebElement.new(:class => 'u-dot--red')
  @cart_summary = WebElement.new(:class => 'MyCart-header')
  @cart_items = CartItem.new(:class => 'MyCart-product')
  @cart_total = WebElement.new(:class => 'MyCart-total')
  @cart_link = WebElement.new("a", @cart)

  def get_cart_qty
    @cart_qty.text
  end

  def hover_over_cart
    @cart.hover
  end

  def click_to_expose_cart
    WebElement.new("a",@cart).click
  end

  def get_total_price_amount
    @cart_total.text.sub('TOTAL $', '').to_f
  end

  def get_shopping_cart_href
    @cart_link.attribute('href')
  end

  def open_cart_item(index)
    @cart_items[index-1].cart_item_name.click
  end

  def get_cart_item(index)
    cart_item = cart_items[index - 1]
    cart_item.verify_visible
    cart_item
  end

end