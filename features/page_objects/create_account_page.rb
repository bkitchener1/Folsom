class CreateAccountPage < PageObject
  @password_field = WebElement.new(id: 'password')
  @submit_registration = WebElement.new('.RegistrationForm-submitButton')
  @registration_confirm_modal = WebElement.new('.remodal')
  @modal_confirm_button = WebElement.new('.RegistrationModal-modalButton')
  @terms_of_use_link = WebElement.new("a[href*='terms-of-use']")


  # adding locators
  @confirm_message = WebElement.new('.shortForm')


end