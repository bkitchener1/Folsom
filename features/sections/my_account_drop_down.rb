class MyAccountDropDown < PageObject

  @open_my_account_dropdown = WebElement.new(class: 'Icon--little-man')
  @drop_down_item_container = WebElement.new(class: 'HeaderDropdown-wrap')
  @my_projects_link = WebElement.new('a[href*=my-projects]')
  @my_account_link= WebElement.new('.AccountLocationList-item span.Icon--my-arrow')
  @order_history_link= WebElement.new('a[href*=order-history]')
  @profile_settings_link= WebElement.new('a[href*=federationregistrationservice]')
  @change_password_link= WebElement.new('a[href*=password]')
  @profile_page_heading= WebElement.new('h3')
  @change_password_heading= WebElement.new('h3')

  def verify_menu_contents_present
    @open_my_account_dropdown.click
    @my_projects_link.verify_visible
    @my_account_link.verify_visible
    @order_history_link.verify_visible
    @profile_settings_link.verify_visible
    @change_password_link.verify_visible
  end

  def click_my_account_option(option)
    sleep(2)
    if option == "Order History"
      @order_history_link.click
    elsif option == "Profile Settings"
      @profile_settings_link.click
    elsif option == "Change your Password"
      @change_password_link.click
    end
  end

  def verify_order_history_load
    $driver.verify_url "#{$base_url}/my-account/order-history"
  end

  def verify_profile_settings_load
    @profile_page_heading.verify_text "Profile Information"
  end

  def verify_change_password_load
    @change_password_heading.verify_text "Provide Your Email Address"
  end

  def open_my_account_dropdown
    @open_my_account_dropdown.click
  end

end