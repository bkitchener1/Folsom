class EmailAnEngineerModalPage < PageObject

  @name_field= WebElement.new(id: 'Name')
  @email_field= WebElement.new(id: 'Email')
  @company_name_field= WebElement.new(id: 'CompanyName')
  @city_field= WebElement.new(id: 'City')
  @state_field= WebElement.new(id: 'State')
  @question_field= WebElement.new(id: 'Question')
  @submit_button= WebElement.new(class: 'u-form-submit')
  @cancel_button= WebElement.new(class: 'u-form-cancel')
  @error_container= WebElement.new(class: 'u-form-errorBox')

  def send_email(data=FigNewton.engineer_email_form.to_hash)
    @name_field.send_keys data[:name]
    @email_field.send_keys data[:email]
    @company_name_field.send_keys data[:company]
    @city_field.send_keys data[:city]
    @state_field.send_keys data[:state]
    @question_field.send_keys data[:question]
  end

  def verify_form_completed(data=FigNewton.engineer_email_form.to_hash)
    @name_field.verify_value data[:name]
    @email_field.verify_value data[:email]
    @company_name_field.verify_value data[:company]
    @city_field.verify_value data[:city]
    @state_field.verify_value data[:state]
    @question_field.verify_value data[:question]
  end

  def submit_form
    @submit_button.click()
  end

  def cancel_sending_email
    @cancel_button.verify_visible.click
  end

  def errors_displayed?
    @error_container.displayed?
  end

end