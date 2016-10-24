class CartOrderSummary < PageObject

  @item_total = WebElement.new([".OrderSummaryWrapper li:nth-child(1)>span:nth-child(2)", "div.breakdown>div>div>div:nth-child(1)>div:nth-child(2)"])
  @shipping_total = WebElement.new([".OrderSummaryWrapper li:nth-child(2)>span:nth-child(2)", "div.breakdown>div>div>div:nth-child(2)>div:nth-child(2)"])
  @tax_total = WebElement.new([".OrderSummaryWrapper li:nth-child(3)>span:nth-child(2)", "div.breakdown>div>div>div:nth-child(3)>div:nth-child(2)"])
  @wire_transfer_total = WebElement.new([".OrderSummaryWrapper li:nth-child(4)>span:nth-child(2)", "div[ng-show*=isWireTransfer]>div"])
  @continue = WebElement.new("a[name*=Continue]")
  @continue_wrapper = WebElement.new(".continueButtonWrapper")
  @order_summary_toggle = WebElement.new(".orderSummaryArrow")
  @promo_applied_message = WebElement.new(".promo-discount-text")
  @header = WebElement.new(".orderSummaryArrow")
  @total = WebElement.new(".total")
  @promo_button= WebElement.new(".input-button")
  @promo_total= WebElement.new(".breakdown div[ng-show='vm.promoDiscountAmount'] div[ar-currency-value]")
  @promo_field= WebElement.new("#promoCode")
  @promo_error= WebElement.new("div[ng-show='vm.promoCodeError']")
  @order_summary_wrapper= WebElement.new(".orderSummaryWrapper")
  @have_promo_message= WebElement.new(".promocode")
  @promo_remove_link= WebElement.new('.remove-code')
  @total_text= WebElement.new(".total>.ng-isolate-scope")
  @overlay = WebElement.new(".Overlay")

  def verify_totals(total, subtotal, tax_total, shipping_total, wire_transfer)
    @total.verify_text total
    @shipping_total.verify_text shipping_total
    @tax_total.verify_text tax_total
    @item_total.verify_text subtotal
    if not wire_transfer == "0"
      @wire_transfer_total.verify_text wire_transfer
    end
  end

  def checkout
    @overlay.verify_not_visible 120
    @continue.verify_visible.verify_attribute_not("disabled","disabled").click()
    @overlay.verify_not_visible 120
  rescue Selenium::WebDriver::Error::UnknownError
    $driver.wait_for_ajax
  end

  def verify_visible
    @total.verify_visible
  end

  def expand_mobile_order_summary
    if not @total.exists? or not @total.displayed?
      @order_summary_toggle.click
    end
  end

  def verify_total_math_with_wire_transfer
    total = @shipping_total.text.gsub("$", "").to_f + @tax_total.text.gsub("$", "").to_f + @item_total.text.gsub("$", "").to_f + @wire_transfer_total.text.gsub("$", "").to_f
    @total.verify_text(total)
  end

  def verify_total_math
    total = @shipping_total.text.gsub("$", "").to_f + @tax_total.text.gsub("$", "").to_f + @item_total.text.gsub("$", "").to_f
    @total.verify_text(total)
  end

  def enter_promo(code)
    @promo_field.send_keys(code)
    @promo_button.click
  end

  def verify_promo_text(text)
    @promo_applied_message.verify_text(text)
  end

  def verify_promo_text_removed
    @have_promo_message.verify_not_visible(10)
  end

  def get_item_total
    @item_total.text
  end

  def get_promo_text
    @promo_total.text
  end

  def verify_total_promo_math
    total = @shipping_total.text.gsub("$", "").to_f + @tax_total.text.gsub("$", "").to_f+ @item_total.text.gsub("$", "").to_f - @promo_total.text.gsub("$", "").to_f
    @total.verify_text(total)
  end

  def promo_error_text(text)
    @promo_error.verify_text(text)
  end

  def promo_remove_code
    @promo_remove_link.click
  end

  def order_summary_present
    @order_summary_wrapper.present?
  end

  def total_present
    @total.present?
  end

  def item_total_present
    @item_total.present?
  end

  def shipping_present
    @shipping_total.present?
  end

  def tax_present
    @tax_total.present?
  end

  def have_promo(text)
    @order_summary_toggle.click
    @have_promo_message.verify_text(text)
  end

  def verify_continue_btn_text(text)
    @continue.verify_text(text)
  end

  def verify_currency_totals(format)
    @currency= Regexp.new FigNewton.currency.send(format)
    @currency_total= @currency === @total_text.text
    expect(@currency_total).to be true
    @currency_tax= @currency === @tax_total.text
    expect(@currency_tax).to be true
    @currency_item= @currency === @item_total.text
    expect(@currency_item).to be true
    @currency_shipping= @currency === @shipping_total.text
  end

end

