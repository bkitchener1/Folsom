class CartItem < PageObject
  @thumbnail= WebElement.new(:css=>".cart-image")
  @item_mpn= WebElement.new(:css=>".u-textSmall strong")
  @item_name= WebElement.new(:css=>".u-textSmall br")
  @item_desc= WebElement.new(:css=>".u-textSmall span.ng-binding")
  @item_ship= WebElement.new(:css=>"div.u-textXSmall>div:nth-child(2)>span>span:nth-child(2)")
  @item_deliv= WebElement.new(:css=>"div.u-textXSmall>div:nth-child(2)>span>span:nth-child(3)")
  @item_qty= WebElement.new(:css=>"div.u-textXSmall>div:nth-child(2)>div>span:nth-child(1)")
  @item_price= WebElement.new(:css=>"div.u-textXSmall>div:nth-child(2)>div>span:nth-child(2)")
  @total_price= WebElement.new(:css=>"div.u-textXSmall>div:nth-child(2)>div>span:nth-child(3)")
end

class PlaceOrder < PageObject
  @order_summary = CartOrderSummary.new(:class=>"cartSummary")
  @cart_header = CartHeader.new(:class=>"cartSummary")
  @cart_items = CartItem.new(:css=>"article.row")

  @shipping_address= WebElement.new(:css=>"div[ng-show*=showShippingAddress]")
  @shipping_method= WebElement.new(:css=>".checkoutSectionBody div[ng-show*=domesticShippingMethod]")
  #@shipping_method_selected = WebElement.new(:css=>".checkoutSectionBody div[ng-show*=domesticShippingMethod]>span:nth-child(2)")

  #added for COP-28
  @shipping_method_international = WebElement.new(:css=>".checkoutSectionBody div[ng-show*=internationalShippingMethod]")
  @shipping_method_selected = WebElement.new(:css=>"div[ng-show*=domesticShippingMethod]>span:nth-child(2)")
  @shipping_method_selected_non_us = WebElement.new(:css=>"div[ng-show*=internationalShippingMethod]>span:nth-child(2)")

  #added for COP-29
  @shipping_address_line1 = WebElement.new(:css=>"div[ng-show*=showShippingAddress]>span:nth-child(1)")
  @shipping_address_line2 = WebElement.new(:css=>"div[ng-show*=showShippingAddress]>span:nth-child(2)")
  @shipping_address_line3 = WebElement.new(:css=>"div[ng-show*=showShippingAddress]>span:nth-child(3)")
  @shipping_address_line4 = WebElement.new(:css=>"div[ng-show*=showShippingAddress]>span:nth-child(4)")
  @shipping_address_line6=  WebElement.new(:css=>"div[ng-show*=showShippingAddress]>span:nth-child(6)")
  @shipping_address_line7 = WebElement.new(:css=>"div[ng-show*=showShippingAddress]>span:nth-child(7)")


  @payment_details= WebElement.new(:css=>"div.paymentMethod")
  @payment_address= WebElement.new(:css=>"div[ng-show*=billingAddress]")
  @payment_address_no_address = WebElement.new(:css=>"p[ng-show*=billingAddress]")
  @cart_items_count= WebElement.new(:css=>"li[ng-show*=cartItemsUS]>label:nth-child(2)")
  @submit_button= WebElement.new(:css=>"#ar-sidebar a[name=ContinueButton]")
  @po_req_error= WebElement.new("div[class=error]")
  @summary_po= WebElement.new("#customerPONumber")
  @summary_po_optional= WebElement.new("input[placeholder='optional']")
  @overlay = WebElement.new(".Overlay")
  #added for COP-27
  #to locate order_summary button and the link to payment url
  @spinner = WebElement.new("img[src*='preloader_anim_red']")
  @order_summary_arrow = WebElement.new(:css=>"div.orderSummaryArrow")
  @link_payment = WebElement.new(:css=>"a[href*='payment']")

  # locators for ARW-3599

  @ultimate_consignee_address_header =  WebElement.new(:css=>"div.ng-scope div[ng-if='vm.ultimateConsigneeAddress']")
  @ultimate_consignee_address_line1 = WebElement.new(:css=>"div[ng-if='vm.ultimateConsigneeAddress'] span[class='ng-binding']")
  @ultimate_consignee_address_line2= WebElement.new(:css=>"div.ng-scope div[ng-if='vm.ultimateConsigneeAddress']>span:nth-of-type(2)")
  @ultimate_consignee_address_line3= WebElement.new(:css=>"div.ng-scope div[ng-if='vm.ultimateConsigneeAddress']>span:nth-of-type(3)")
  @ultimate_consignee_address_line4= WebElement.new(:css=>"div.ng-scope div[ng-if='vm.ultimateConsigneeAddress']>span:nth-of-type(4)")
  @ultimate_consignee_address_line6= WebElement.new(:css=>"div.ng-scope div[ng-if='vm.ultimateConsigneeAddress']>span:nth-of-type(6)")
  @ultimate_consignee_address_line7= WebElement.new(:css=>"div.ng-scope div[ng-if='vm.ultimateConsigneeAddress']>span:nth-of-type(7)")



  def abort_if_prod
    environments = ["cms.arrow.com", "/cart.arrow.com","hkg.arrow.com","ord.arrow.com","lon.arrow.com"]
    environments.each do |env|
      if $driver.current_url.include? env
        raise Cucumber::Core::Test::Result::Skipped, "Skipping Scenario"
      end
    end
  end

  def submit
    @overlay.verify_not_visible
    @spinner.verify_not_visible
    abort_if_prod
    @submit_button.click
    @submit_button.verify_not_visible(timeout = 120)
  end

  def verify_visible
    @overlay.verify_not_visible
    @shipping_address.verify_present
    @shipping_method.verify_present
    @payment_details.verify_present
    @payment_address.verify_present
  end

  def verify_po_req_error
    @po_req_error.verify_text"PO Number is required for terms payments"
  end

  def verify_po_field
    @summary_po.verify_present
    @summary_po_optional
  end

  #adding method for COP-29

  def verify_shipping_address_text(user_name,company_name,phone_no,address_line1,address_line2,address_line3)
    @shipping_address_line1.verify_text(user_name)
    @shipping_address_line2.verify_text(company_name)
    @shipping_address_line3.verify_text(phone_no)
    @shipping_address_line4.verify_text(address_line1)
    @shipping_address_line6.verify_text(address_line2)
    @shipping_address_line7.verify_text(address_line3)
  end

  #adding method for COP-27

  def verify_payment_method_text(payment_type,card_holder_name,last_four)
    @payment_details.verify_text(payment_type)
    @payment_details.verify_text(card_holder_name)
    @payment_details.verify_text(last_four)
  end

  #added for COP-27

  def
    verify_payment_method_text_expiration(expiration_date)
    @payment_details.verify_text(expiration_date)
  end

  # added for COP-27

  def verify_billing_address_text(user_name,company_name,address_line1,address_line2,address_line3,address_line4)
    @payment_address.verify_text(user_name)
    @payment_address.verify_text(company_name)
    @payment_address.verify_text(address_line1)
    @payment_address.verify_text(address_line2)
    @payment_address.verify_text(address_line3)
    @payment_address.verify_text(address_line4)

  end

  # added for COP-27

  def verify_billing_add_optional(billing_add_not_selected)
    @order_summary_arrow.click
    @payment_address_no_address.verify_text(billing_add_not_selected)
  end

  # added for COP-27

  def verify_payment_link(payment_url)
    @order_summary_arrow.click
    @link_payment.verify_attribute('href',payment_url)
  end

  # added for ARW-3599

  def verify_ultimate_consignee_address

    @ultimate_consignee_address_header.verify_present
    @ultimate_consignee_address_header.verify_text "Ultimate Destination"
    @ultimate_consignee_address_header.scroll_into_view
    @ultimate_consignee_address_line1.verify_present
    @ultimate_consignee_address_line1.verify_text "bill add"
    @ultimate_consignee_address_line2.verify_text "bill add"
    @ultimate_consignee_address_line3.verify_text "303-665-8901"
    @ultimate_consignee_address_line4.verify_text "1111 arrow"
    @ultimate_consignee_address_line6.verify_text "centennial, CO 80012"
    @ultimate_consignee_address_line7.verify_text "US"
  end

end