class Register < PageObject
  @firstname= WebElement.new(:id=>"firstname")
  @lastname= WebElement.new(:id=>"lastname")
  @company= WebElement.new(:id=>"company")
  @phone= WebElement.new(:id=>"phone")
  @country= WebElement.new(:id=>"country")
  @email= WebElement.new(:id=>"userId")
  @confirm_email= WebElement.new(:id=>"email")
  @password= WebElement.new(:id=>"password")
  @link_account= WebElement.new(:id=>"acct_link_account")
  @terms= WebElement.new(:id=>"privacyPolicy")
  @submit= WebElement.new(:id=>"btn_submit_registration")
  @forgot_password= WebElement.new(:link_text=>"I forgot my password")
  @arrowvia= WebElement.new(:link_text=>"I want to login to ArrowVia")

  def register_user(first, last, comp, number, country, email, pass)
    @firstname.send_keys first
    @lastname.send_keys last
    @company.send_keys comp
    @phone.send_keys number
    @country.select_by(country)
    @email.send_keys email
    @confirm_email.send_keys email
    @password.send_keys pass
    @terms.check
    @submit.click
  end

end