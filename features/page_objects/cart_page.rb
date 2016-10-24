class CartPage < PageObject

  @page_url = FigNewton.cart_url
  @added_item_list = WebElement.new(class: 'u-row CartSummary-textBody')
  @check_out = WebElement.new(name: 'ContinueCheckoutButton')

  def item_added?(item = FigNewton.product_for_purchase)
    @added_item_list.verify_present
    @added_item_list.verify_text(item)
  end

  def check_out_basket
    @check_out.verify_present.click
  end

end