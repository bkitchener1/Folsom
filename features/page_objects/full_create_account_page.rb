class FullCreateAccountPage < CreateAccountPage

  @first_name_field = WebElement.new(id: 'firstname')


  def displayed?
    @first_name_field.verify_visible
  end

end