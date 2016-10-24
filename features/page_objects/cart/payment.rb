class Payment < PageObject

  @order_summary = CartOrderSummary.new(:class=>"cartSummary")
  @summary_arrow= WebElement.new(".orderSummaryArrow")
  @header = CartHeader.new( :class=>"header")
  @address_section = ShippingAddress.new(:class=>"address-container")
  @payment_method = WebElement.new(:css=>"select[ng-model*=paymentMethod]")
  @name= WebElement.new(:id=>"CardholderName")
  @number= WebElement.new("#CardNumber,#FakeCreditCardNumber")
  @code= WebElement.new(:id=>"CCV")
  @month= WebElement.new(:id=>"CCMonth")
  @year= WebElement.new(:id=>"CCYear")
  @wire_message= WebElement.new(:css=>"fieldset[name=wiretransfer]")
  @wire_delay_shipping= WebElement.new("span[translate='payment.wireTransferDelayNotice']")
  @terms_po= WebElement.new(:id=>"PONumber")
  @payment_icons= WebElement.new(".text-right")
  @visa_icon= WebElement.new("img[alt='Visa']")
  @mastercard_icon= WebElement.new("img[alt='Mastercard']")
  @amex_icon= WebElement.new("img[alt='AMEX']")
  @discover_icon= WebElement.new("img[alt='Discover']")
  @paypal_icon= WebElement.new("img[alt='PayPal']")
  @swift_icon= WebElement.new("img[alt='SWIFT']")
  @arrow_credit_icon= WebElement.new("img[alt='Arrow Credit Services']")
  @credit_card_form= WebElement.new(".col-lg-7 , .innerGroup .creditCard")
  @fake_card= WebElement.new("#FakeCreditCardNumber")
  @required_field_error= WebElement.new("#payment-error")
  @credit_card_field_red= WebElement.new(".input-error")
  @arrange_message_text= WebElement.new("fieldset[name='arrange']")
  @wireless_transfer_instructions= WebElement.new("a[href='//static2.arrow.com/wireinstructions/verical_wiring_instructions_en.pdf']")
  @wire_fee= WebElement.new("div[ng-show='vm.isWireTransfer']")
  @terms_agreement= WebElement.new("fieldset[name='terms']")
  @summary_po= WebElement.new("#customerPONumber")
  @terms_shipping_error= WebElement.new("span[translate='payment.termsAddressInvalidError']")
  @po_error= WebElement.new("#payment-error")

  #locator for informational message for COP-26
  @payment_method_error = WebElement.new("span[class='ng-binding'][ng-hide*=Currency]")

  def enter_payment(payment, name, number, code, month, year)
    @payment_method.select_by(:text, payment)
    @name.send_keys(name)
    @number.send_keys number
    @code.send_keys code
    @month.select_by(:text,month)
    @year.send_keys(year)
  end

  def select_paypal
    @payment_method.select_by(:text,"PayPal")
  end

  def select_payment_methods
    @payment_method.click
  end


  def available_payment_methods
    @payment_method.verify_text"Credit Card"
    @payment_method.verify_text"PayPal"
    @payment_method.verify_text"Arrange"
    @payment_method.verify_text"Wire Transfer"
  end

  def payment_methods_terms
    @payment_method.verify_text"Credit Card"
    @payment_method.verify_text"PayPal"
    @payment_method.verify_text"Terms"
    @payment_method.verify_text"Arrange"
    @payment_method.verify_text"Wire Transfer"
  end

  def check_payment_icons
    @visa_icon.verify_visible
    @amex_icon.verify_visible
    @mastercard_icon.verify_visible
    @discover_icon.verify_visible
    @paypal_icon.verify_visible
    @swift_icon.verify_visible
    @arrow_credit_icon.verify_visible
  end

  def verify_creditcard_form
    @credit_card_form.verify_visible
  end

  def enter_card_number(card_number)
    @number.set_text(card_number)
  end

  def verify_card_text(card_number)
    @number.verify_value(card_number)
  end

  def verify_fake_card_text(card_number)
    @fake_card.verify_value(card_number)
  end

  def enter_ccv_number(ccv_number)
    @code.set_text(ccv_number)
  end

  def verify_ccv_text(ccv_number)
    @code.verify_value(ccv_number)
  end

  def enter_name(name)
    @name.set_text(name)
  end

  def click_credit_number
    @summary_arrow.click
    @fake_card.click
  end

  def required_error_text
    @required_field_error.verify_text"Cardholder Name is required."
    @required_field_error.verify_text"Not a valid Visa, Mastercard, Discover or American Express card."
    @required_field_error.verify_text"Invalid card type for currency"
    @required_field_error.verify_text"Card Number is required."
    @required_field_error.verify_text"CV Code is required."
    @required_field_error.verify_text"Expiration Month is required."
    @required_field_error.verify_text"Expiration Year is required."
  end

  def credit_card_red
    @credit_card_field_red.verify_visible
  end

  def arrange_text
    @arrange_message_text.verify_text"After this order has been placed, a customer service representative will contact you to arrange payment."
  end

  def delay_shipping_text
    @wire_delay_shipping.verify_text" Inventory will NOT be reserved and the added time to process the payment may increase the risk that the seller no longer has the parts available. If you have time-critical requirements, we suggest selecting a different method of payment."
  end

  def verify_wireless_instructions
    @wireless_transfer_instructions.verify_visible
  end

  def verify_wire_fee
    @wire_fee.verify_present
  end

  def verify_terms_agreement
    @terms_agreement.verify_text"By using this payment method, you agree to having the order total added to your terms account with Arrow."
  end

  def verify_sum_po(num)
    @summary_po.verify_value(num)
  end

  def verify_po_field
    @terms_po.verify_present
  end

  def verify_term_shipping_error
    @terms_shipping_error.verify_text"The shipping address you selected is not a valid terms address. Please "
  end

  def verify_po_req_error
    @po_error.verify_text"Purchase Order Number is required."
  end

  def clear_po_field
    @summary_po.clear
  end

  def verify_cc_expired_error
    required_field_error.verify_text"This card is expired."
  end

  # added method for COP-26

  def verify_payment_method
    @payment_method.verify_text"Credit Card"
    @payment_method.verify_text_not "PayPal"
    @payment_method.verify_text_not "Arrange"
    @payment_method.verify_text_not "Wire Transfer"
  end

  def verify_only_credit_card_icons
      @visa_icon.verify_visible
      @amex_icon.verify_visible
      @discover_icon.verify_visible
  end

  # added method for COP-26

  def verify_message_nonus
    @payment_method_error.verify_text "Only Credit Card Payments are allowed for Non-USD currencies."
  end

  def click_payment_icon(type)
    if (type) == "Visa"
      @visa_icon.click
    elsif (type) == "MasterCard"
      @mastercard_icon.click
    elsif (type) == "AMEX"
      @amex_icon.click
    elsif (type) == "Discover"
      @discover_icon.click
    elsif (type) == "PayPal"
      @paypal_icon.click
    elsif (type) == "Swift"
      @swift_icon.click
    elsif (type) == "Arrow Credit"
      @arrow_credit_icon.click
    end
  end

  def payment_method_text
    @payment_method.as_select.first_selected_option.text
  end

  #checks accepted payments based on currency type
   def verify_cur_accepted_payment(currency)
     @visa =WebElement.new("img[ng-src='/img/payment-methods/VISA_logo.png']")
     @master =WebElement.new("img[ng-src='/img/payment-methods/Mastercard_logo.png']")
     @amex =WebElement.new("img[ng-src='/img/payment-methods/AMEX_logo.png']")
     @discover =WebElement.new("img[ng-src='/img/payment-methods/Discover_logo.png']")
     @paypal =WebElement.new("img[ng-src='/img/payment-methods/PayPal_logo.png']")
     @swift =WebElement.new("img[ng-src='/img/payment-methods/SWIFT_logo.png']")
     @arrow_credit_grey =WebElement.new("img[src='/img/payment-methods/Arrow_Credit_Services_logo_grey.png']")
     @amex_grey =WebElement.new("img[ng-src='/img/payment-methods/AMEX_logo_grey.png']")
     @discover_grey =WebElement.new("img[ng-src='/img/payment-methods/Discover_logo_grey.png']")
     @paypal_grey =WebElement.new("img[ng-src='/img/payment-methods/PayPal_logo_grey.png']")
     @swift_grey  =WebElement.new("img[ng-src='/img/payment-methods/SWIFT_logo_grey.png']")
     if currency == "USD"
       @payment_method.verify_text "Credit Card"
       @payment_method.verify_text "PayPal"
       @payment_method.verify_text "Arrange"
       @payment_method.verify_text "Wire Transfer"
       @visa.verify_visible
       @master.verify_visible
       @amex.verify_visible
       @discover.verify_visible
       @paypal.verify_visible
       @swift.verify_visible
       @arrow_credit_grey.verify_visible
     elsif currency == "BRL" || currency == "MYR" || currency == "TWD"
       @payment_method.verify_text "Credit Card"
       @payment_method.verify_text_not "PayPal"
       @payment_method.verify_text_not "Arrange"
       @payment_method.verify_text_not "Wire Transfer"
       @visa.verify_visible
       @master.verify_visible
       @amex_grey.verify_visible
       @discover_grey.verify_visible
       @paypal_grey.verify_visible
       @swift_grey.verify_visible
       @arrow_credit_grey.verify_visible
     else
       @payment_method.verify_text "Credit Card"
       @payment_method.verify_text_not "PayPal"
       @payment_method.verify_text_not "Arrange"
       @payment_method.verify_text_not "Wire Transfer"
       @visa.verify_visible
       @master.verify_visible
       @amex.verify_visible
       @discover_grey.verify_visible
       @paypal_grey.verify_visible
       @swift_grey.verify_visible
       @arrow_credit_grey.verify_visible
     end
   end
end
