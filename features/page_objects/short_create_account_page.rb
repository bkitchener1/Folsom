class  ShortCreateAccountPage < CreateAccountPage

  @page_url = "#{$base_url}/register"

  @full_name_field = WebElement.new(id: 'fullName')
  @email_field = WebElement.new(".RegistrationForm-email")
  @modal_popup = WebElement.new(".remodal")
  @modal_ok_btn = WebElement.new(".RegistrationModal-modalButton")
  @modal_login_user_btn = WebElement.new("button[name=loginUser]")
  @modal_goto_login_btn = WebElement.new("button[name=goToRedirectUrl]")

  #locators for ARW-851
  @password_field = WebElement.new(id: 'password')
  @submit_registration = WebElement.new('.RegistrationForm-submitButton')
  @registration_confirm_modal = WebElement.new('.remodal')
  @modal_confirm_button = WebElement.new('.RegistrationModal-modalButton')
  @terms_of_use_link = WebElement.new("a[href*='terms-of-use']")
  @confirm_message = WebElement.new('.shortForm')

  #locators for logged-in
    @little_man_icon = WebElement.new(".Icon--little-man")
    @myarrow_loggedin= WebElement.new("#header-loggedIn")
    @myarrow_loggedin_title =WebElement.new('.HeaderDropdown-title')
    @logout_button =WebElement.new("a[href='/en/endpoints/logout?originUrl=']")

  def create_new_account(name =random_string, email_address="#{random_string}@mailinator.com", password="BI0Tester")
    @full_name_field.send_keys name
    @email_field.send_keys email_address
    @password_field.send_keys password
    @submit_registration.click
    {email: email_address, password: password}
  end

  def modal_dialog_displayed?
   @modal_popup.verify_visible
  end

  def click_to_login
    @modal_login_user_btn.click
  end

  def click_to_goto_login_page
    @modal_goto_login_btn.verify_visible.click
  end

  # add for ARW-851

  def verify_fields
    @full_name_field.verify_present
    @email_field.verify_present
    @password_field.verify_present
  end

  def verify_account_confirmation
    @modal_confirm_button.verify_present
    @confirm_message.verify_text
            'Your account is now activated. To view or change your account information, click on the user icon in the header.'
  end

  def verify_logged_in
       # $driver.verify_url(FigNewton.base_url)
        @little_man_icon.click
        @myarrow_loggedin.verify_present
        @myarrow_loggedin_title.verify_text(FigNewton.myArrowUsertext)
        @logout_button.verify_present
      end

end