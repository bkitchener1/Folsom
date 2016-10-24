class ShippingMethod < PageObject
  @arrow_icon_head= WebElement.new("a[class=ar-navbar-brand]")
  @order_summary = CartOrderSummary.new(:css=>".cartSummary,.order-summary")
  @header = CartHeader.new(:class=>"header")
  @expand_toggle= WebElement.new(:css=>".Switch")
  @estimated_delivery= WebElement.new(".allItems>.row>div>div:nth-child(2)>div>div:nth-child(2)")
  @show_all= WebElement.new(:css=>"a[title=show]")
  @use_own_us_shipping= WebElement.new("label[for='useOwnShippingUS']")
  @shipping_account= WebElement.new(:id=>'accountNumberUS')
  @shipping= WebElement.new(:id=>'shippingMethodUS')
  @shipping_non_us= WebElement.new("#shippingMethodNonUS")
  @origin_tab= WebElement.new(".grid-title")
  @items_ships_from= WebElement.new(".ship-items")
  @shipping_error= WebElement.new("div[class='row error']")
  @us_account_num_field= WebElement.new("#accountNumberUS")
  @use_own_non_us_shipping= WebElement.new("label[for='useOwnShippingNonUS']")
  @us_item_level= WebElement.new("#allItems-NonUS")
  @us_item_level_ships_from= WebElement.new("div.u-textXSmall>div:nth-child(2)>span")
  @us_item_level_est_ship= WebElement.new("div.u-textXSmall>div:nth-child(2)>div>div:nth-child(1)>span:nth-child(1)")
  @us_item_level_est_del= WebElement.new("div.u-textXSmall>div:nth-child(2)>div>div:nth-child(2)>span:nth-child(1)")
  @non_us_item_level= WebElement.new(".allItems-NonUS")
  @non_us_item_level_ships_from= WebElement.new("div.u-textXSmall>div:nth-child(2)>span")
  @non_us_item_level_est_ship= WebElement.new("div.u-textXSmall>div:nth-child(2)>div>div:nth-child(1)>span:nth-child(1)")
  @non_us_item_level_est_del= WebElement.new("div.u-textXSmall>div:nth-child(2)>div>div:nth-child(2)>span:nth-child(1)")
  @section_title= WebElement.new("#ar-checkoutStatus>div>div:nth-child(3)")
  @expand_all_text= WebElement.new(".expandCollapseAll")
  @got_question_heading= WebElement.new(".heroText>.heading")
  @got_question_body= WebElement.new(".heroText>p")
  @chat_live= WebElement.new("chat-cta>a[ng-click='openSupport()']")
  @overlay = WebElement.new(".Overlay")



  def verify_page
    @overlay.verify_not_visible 120
    @estimated_delivery.verify_present
    @show_all.verify_present
    @use_own_shipping.verify_present
    @shipping_account.verify_present
    @shipping.verify_present
  end

  def select_default_shipping()
    @overlay.verify_not_visible 120
    @shipping.verify_present
    @@shipping_method = @shipping.text.split('-')[1]
  end

  # correction to initialize

  def ShippingMethod.shipping_method
    @@shipping_method=FigNewton.shipping_methods.fedex.ground.to_s

  end

  #Added method for COP-28
  def ShippingMethod.shipping_method_non_us
    @@shipping_method_non_us
  end

  def shipping_type(type)
    @overlay.verify_not_visible 120
    @shipping.select_by(:value,type)
  end

  # Added method for COP-28
  def shipping_type_non_us(type)
    @overlay.verify_not_visible 120
    @shipping_non_us.select_by(:value,type)
    #@@shipping_method_non_us = @shipping_non_us.text.split('-')[1]
    @@shipping_method_non_us = "DHL"+ @shipping_non_us.text.split('-')[1] + "$"+"43.99"
  end

  # Added method for COP-28
  def shipping_type_us(type)
    @shipping.select_by(:value,type)
    @@shipping_method = @shipping.text.split('-')[1]
  end

  def origin_tab_text(text)
    @origin_tab.verify_text(text)
  end

  def ships_from_text(text)
    @items_ships_from.verify_text(text)
  end

  def use_own_shipping_present
    @use_own_us_shipping.present?
  end

  def verify_us_shipping_default
    @shipping.as_select.first_selected_option.text
  end

  def verify_error_text(text)
    @shipping_error.verify_text(text)
  end

  def click_own_us_shipping
    @use_own_us_shipping.click
  end

  def click_own_non_us_shipping
    @use_own_non_us_shipping.click
  end

  def get_use_own_us_shipping_text
    @use_own_us_shipping.text
  end

  def shipping_method_text(arg)
    @shipping.verify_text(arg)
  end

  def verify_us_account_field
    @us_account_num_field.present?
  end

  def get_us_shipping_text
    @shipping.text
  end

  def get_non_us_shipping_text
    @shipping_non_us.text
  end

  def verify_non_us_shipping_default
    @shipping_non_us.as_select.first_selected_option.text
  end

  def non_us_item_ships_from_text
    @non_us_item_level_ships_from.text
  end

  def non_us_item_est_ship_present
    @non_us_item_level_est_ship.present?
  end

  def non_us_item_est_del_present
    @non_us_item_level_est_del.present?
  end

  def us_item_ships_from_text
    @us_item_level_ships_from.text
  end

  def us_item_est_ship_present
    @us_item_level_est_ship.present?
  end

  def us_item_est_del_present
    @us_item_level_est_del.present?
  end


  def click_arrow_icon
    @arrow_icon_head.click
  end

  def got_question_heading_text(text)
    @got_question_heading.verify_text(text)
  end

  def got_question_body_text(text)
    @got_question_body.verify_text(text)
  end
end