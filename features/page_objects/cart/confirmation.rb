class CartItemRow < PageObject
    @thumbnail= WebElement.new(:css=>"img.CartSummary-cartProductImage")
    @mpn= WebElement.new(:css=>".CartSummary-catalogPart")
    @manufacturer= WebElement.new(:css=>".CartSummary-descriptionContainer>div:nth-child(2)")
    @description= WebElement.new(:css=>".CartSummary-descriptionContainer>div:nth-child(3)")
    @cpn= WebElement.new(:css=>".CartSummary-descriptionContainer>div:nth-child(4)")
    @ships_from= WebElement.new(:css=>".CartSummary-shipDateContainer>div:nth-child(1)")
    @ship_date= WebElement.new(:css=>".CartSummary-shipDateContainer>div:nth-child(2)")
    @est_deliv= WebElement.new(:css=>".CartSummary-shipDateContainer>div:nth-child(3)")
    @quantity= WebElement.new(:css=>".CartSummary-priceContainer>div:nth-child(1)")
    @price= WebElement.new(:css=>".CartSummary-priceContainer>div:nth-child(2)")
    @total= WebElement.new(:css=>".CartSummary-priceContainer>div:nth-child(3)")

end

class Confirmation < PageObject
  attr_reader :order_completed, :order_number

  @order_summary = CartOrderSummary.new(:class=>"cartSummary")
  @cart_header = CartHeader.new(:class=>"cartSummary")
  @item_row = CartItemRow.new(:css=>"article")

  @order_completed= WebElement.new(:css=>".SalesOrder-header")
  @thank_you_message= WebElement.new(:id=>"thankYouMessage")
  @shipping_address= WebElement.new(:id=>"shippingAddress")
  @shipping_method= WebElement.new(:id=>"shippingMethod")
  #@payment_card= WebElement.new(:id=>"paymentDetails")
  @payment_details= WebElement.new("#paymentDetails")
  @payment_card_paypal_text= WebElement.new(:css=>"div[class*='paymentMethod']>p")
  @payment_address= WebElement.new(:id=>"billingAddress")
  @order_number= WebElement.new(:css=>"#orderConfirmation h2")
  @wire_terms= WebElement.new(:css=>"#payment a")
  @loader = WebElement.new(:css=>".Loader")

  @order_summary_arrow = WebElement.new(:css=>"div.orderSummaryArrow")

  # locator for ultimate consignee address

  @ultimate_destination= WebElement.new(:id=>"endCustomerAddress")

  # locator for clicking logout on confirmation page for order detail with temp user validation

  @user_icon_confirmation_page =  WebElement.new(:css=>"span[class='CircleImage']")
  @logout_confirmation_page = WebElement.new("a[href='/en/endpoints/logout?originUrl=']")

  def verify_order_completed
    @order_number.verify_visible
  end

  def get_order_number
    text = @order_number.text
    text = text.split("Number ")[1]
  end

  def verify_page
    @loader.verify_not_visible
    @order_number.verify_visible
  end
end