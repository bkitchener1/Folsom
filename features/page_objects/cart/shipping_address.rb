class ShippingAddress < PageObject
  attr_accessor :existing_address, :delete_address_modal, :add_address, :page_title, :no_address_text

    @page_url = FigNewton.cart_url + "/#/shipping_address"
    @existing_address = ExistingAddress.new("article.shipping-container")
    @delete_address_modal = DeleteAddressModal.new(:css=>"form[name='vm.addressForm']")
    @add_address = WebElement.new(:css=>"span.linkSpan")
    @page_title = WebElement.new("#ar-checkoutStatus>div>div:nth-child(2)")
    @no_address_text = WebElement.new(".checkoutSectionBody div.ng-binding")
    @step_1 = WebElement.new("a[ui-sref='Checkout.ShippingAddress']")
    @step_3 = WebElement.new("a[ui-sref='Checkout.Payment']")
    @continue_checkout_button = WebElement.new(".continueButtonWrapper")
    @select_address_error = WebElement.new("ul[class='col-xs-12 form-error error']")
    @select_address_tab = WebElement.new(".grid-title")
    @order_summary_tab = WebElement.new(".ar-orderBoxHeader")
    @first_trash = WebElement.new(".address-container>div:nth-child(1)>article>div[class='actions']>div:nth-child(2)>a")
    @step_label = WebElement.new("#ar-checkoutStatus>div>ul>li:nth-child(1)")

  #locators for logged-in
  @little_man_icon = WebElement.new(".Icon--little-man")
  @myarrow_loggedin= WebElement.new("#header-loggedIn")
  @myarrow_loggedin_title =WebElement.new('.HeaderDropdown-title')
  @logout_button =WebElement.new("a[href='/en/endpoints/logout?originUrl=']")

  def verify_visible
    @add_address.verify_visible
    @page_title.verify_text "Shipping Address"
  end

  # click not selecting
  def select_first_address(text)
    #@existing_address.first.address.click
    @existing_address.first.address.select
  end

  def select_address(text)
    @existing_address.verify_present.where(:text,text).first.click
  end

  def delete_address(text)
    address =  @existing_address.where(:text,text).first
    address.trash.click
    @delete_address_modal.update.click
    sleep(2)
  end

  def edit_address(text)
     addresses = @existing_address.verify_visible.where(:text,text)
     address = addresses.first
     if address.nil?
       $logger.error "Found #{addresses.count} addresses but none match"
     end
     address.edit.click
  end

  def address_is_present?(text)
    address = @existing_address.where(:text,text)
    address.count > 0
  end

  def no_address
    @no_address_text.verify_visible
    @no_address_text.verify_text "You do not have any addresses on file. Please add a new address to continue."
  end

  def add_address_button
    @add_address.verify_visible
  end

  def click_step_1
    @step_1.verify_present
    @step_1.js_click
  end

  def click_step_3
    @step_3.verify_visible
    @step_3.js_click
  end

  def click_continue_checkout
    @continue_checkout_button.verify_visible
    @continue_checkout_button.click
  end

  def verify_select_address_error(text)
    @select_address_error.verify_visible
    @select_address_error.verify_text(text)
  end

  def verify_address_selected(address)
    if not @existing_address.where(:text,address).first.attribute("class").include? "selectedAddress"
      raise "#{address} is not selected"
    end
  end

  def verify_language(title)
    @page_title.verify_text(title)
  end

  def first_add_present
    @first_add.displayed?
  end

  def delete_first_add
    @first_trash.click
    @delete_address_modal.update.click
  end

  # 851

  def verify_logged_in
    @little_man_icon.click
    @myarrow_loggedin.verify_present
    @myarrow_loggedin_title.verify_text(FigNewton.myArrowUsertext)
    @logout_button.verify_present
  end

end