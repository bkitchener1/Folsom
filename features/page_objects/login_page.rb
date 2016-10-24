class LoginPage < PageObject
  @page_url = $base_url + "/login?url="

  @arrow_username_field = WebElement.new("#username")
  @arrow_password_field = WebElement.new( "#password")
  @arrow_login_btn = WebElement.new('.LoginPage-formSubmit')
  @log_in_mobile = WebElement.new('.NavIcons-element-text')
  @create_account_link = WebElement.new('.js-signup-link')
  @arrow_com = WebElement.new(:id => 'arrowCom')
  @my_arrow = WebElement.new('.header-myArrowTM-link')
  @my_arrow_mobile = WebElement.new('.ButtonList>li:nth-child(2)')
  @region_selector = WebElement.new(:class => 'LoginForm-select')
  @my_arrow_radio_button = WebElement.new(:id => 'myArrow')
  @region_selector_radio_button = WebElement.new(:css =>'.myArrow regionSelectSection is-active')
  @region_selector_list = WebElement.new(:css =>'.u-form-select')

  def select_arrow_com_login
    @arrow_com.click
  end


  def select_my_arrow_login
    if $size == "mobile"
      @log_in_mobile.click
      @my_arrow_mobile.click
    else
      @my_arrow.click
    end
  end


  def login_to_arrow_site(username=FigNewton.username, password=FigNewton.password)
    # self.accept_cookie_policy
    @arrow_username_field.set_text username
    @arrow_password_field.set_text password
    @arrow_login_btn.click.verify_not_visible
  end

  def login(username=FigNewton.username, password=FigNewton.password)
    @arrow_username_field.set_text username
    @arrow_password_field.set_text password
    @arrow_login_btn.click.verify_not_visible
  end

  def login_to_my_arrow_region(region='Americas', username=FigNewton.username, password=FigNewton.password)
    if $size == "mobile"
      @log_in_mobile.click
      @my_arrow_mobile.click
    else
      @my_arrow.click
    end
    @region_selector.verify_visible
    @region_selector.select_by(:text, region)
    login_to_arrow_site(username, password)
  end

  def click_create_account
    @create_account_link.click
  end

  # add for ARW-3836

  def verify_no_radio_buttons
    @arrow_com.verify_not_visible
    @my_arrow_radio_button.verify_not_visible
    @region_selector_radio_button.verify_not_visible
    @region_selector_list.verify_not_visible
  end
end

