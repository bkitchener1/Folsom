class AddNewAddressModal < PageObject

  @container = WebElement.new(class: 'modal-form ng-scope')
  @name_field = WebElement.new({id: 'name'},@container)
  @phone_number_field = WebElement.new({id: 'phone1'},@container)

  @street_field = WebElement.new({id: 'street1'},@container)
  @city_field = WebElement.new({id: 'city'},@container)
  @postal_code_field = WebElement.new({id: 'postalCode'},@container)
  @submit_address = WebElement.new({class: 'btn btn-red ng-binding'},@container)

  def add_address
    if container.exists?
      self.complete_form
      self.submit_address.click
    end
  end

  def complete_form
    self.name_field.send_keys(random_string 8)
    self.phone_number_field.send_keys(random_string 12)
    self.street_field.send_keys(random_string 12)
    self.city_field.send_keys(random_string 10)
    self.postal_code_field.send_keys(random_string 6)
  end

end