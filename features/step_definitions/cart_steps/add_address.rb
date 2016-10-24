

Given(/^I visit the add address page$/) do
  AddAddress.open_page
end


And(/^I enter "([^"]*)" into field "([^"]*)"$/) do |arg1, arg2|
  page = AddAddress.new
  field_name = arg2
  field = page.send(field_name)
  page.send(field_name).verify_visible
  page.send(field_name).set_text(arg1)
end

And(/^I click the pencil icon$/) do
  AddAddress.new.update.click
end

And(/^I select "([^"]*)" as the country$/) do |arg|
  page = AddAddress
  country = arg
  # page.select_country(country)
end

And(/^I click update$/) do
  AddAddress.new.update.click

end


And(/^I click cancel$/) do
  AddAddress.new.close.click
end
Then(/^the "([^"]*)" field should show that it is required$/) do |arg|
  AddAddress.new.verify_error_message_for_field(arg)
end

Then(/^the country dropdown should contain sections called "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  AddAddress.new.verify_country_group("Common Countries")
  AddAddress.new.verify_country_group("All Countries")

end

And(/^each section in the country dropdown should be sorted alphabetically$/) do
  AddAddress.new.verify_country_sorted
end

When(/^I select country "([^"]*)"$/) do |arg|
  AddAddress.new.select_country(arg)
end

Then(/^the reseller certificate should be visible$/) do
  AddAddress.new.certificate_upload.verify_visible
end

Then(/^the reseller certificate should not be visible$/) do
  AddAddress.new.certificate_upload.verify_not_visible
end

Then(/^the state field should be a dropdown$/) do
  AddAddress.new.verify_state_field(:dropdown)
end

Then(/^the state field should be a text field$/) do
  AddAddress.new.verify_state_field
end

Then(/^the CR Code field should be visible$/) do
  AddAddress.new.cr_code.verify_visible
end

Then(/^the VAT ID field should be visible/) do
  AddAddress.new.vat_id.verify_visible
end

Then(/^the VAT ID field should not be visible/) do
  AddAddress.new.vat_id.verify_not_visible
end

And(/^the "([^"]*)" field should show that it is not required$/) do |arg|
  AddAddress.new.verify_no_error_message_for_field(arg)
end

Then(/^the state field should be a text field and have label "State \/ Province"$/) do
  sleep 2
  AddAddress.new.verify_state_label("STATE / PROVINCE")
end


Then(/^the state dropdown should display "([^"]*)"$/) do |arg|
  AddAddress.new.verify_state_dropdown(arg)
end

Then(/^the address modal should have field "([^"]*)" with value "([^"]*)"$/) do |arg1, arg2|
  AddAddress.new.verify_field(arg1, arg2)
end


And(/^I upload a reseller certificate$/) do
  file = File.absolute_path(File.join($root, "reseller_cert.docx"))
  print "uploading file '#{file}'"
  AddAddress.new.upload_reseller_cert(file)
end

Then(/^the reseller certificate already uploaded message should display$/) do
  AddAddress.new.reseller_certificate_message.verify_visible
end

# added new field via step - And I select address type "0"

And(/^I have already added an address$/) do
  if not ShippingAddress.new.address_is_present?("123 S Colorado")
    step 'I click the add new address link'
    step 'I select address type "0"'
    step 'I enter "Test User" into field "name"'
    step 'I enter "Aspenware" into field "company"'
    step 'I enter "3033122135" into field "phone"'
    step 'I select "United States of America" as the country'
    step 'I enter "123 S Colorado" into field "address"'
    step 'I enter "Denver" into field "city"'
    step 'I enter "80113" into field "zip"'
    step 'I enter "b.kitchener@aspenware.com" into field "email"'
    step 'I click update'
    step 'I visit step one'
  end
end

Then(/^the add reseller certificate button should be visible$/) do
  AddAddress.new.certificate_upload.verify_visible
end

Then(/^the add reseller certificate button should not be visible$/) do
  AddAddress.new.certificate_upload.verify_not_visible
end

# added new field via step - And I select address type "0"

And(/^I have added an address to delete$/) do
  And(/^I have already added an address$/) do
    if not ShippingAddress.new.address_is_present?("123 S Colorado")
      step 'I click the add new address link'
      step 'And I select address type "0"'
      step 'I enter "Test User" into field "name"'
      step 'I enter "Aspenware" into field "company"'
      step 'I enter "3033122135" into field "phone"'
      step 'I select "United States of America" as the country'
      step 'I enter "123 S Colorado" into field "address"'
      step 'I enter "Denver" into field "city"'
      step 'I enter "80113" into field "zip"'
      step 'I enter "b.kitchener@aspenware.com" into field "email"'
      step 'I click update'
      step 'I visit step one'
    end
  end
end

# add for form level error when billing address is added

Then(/^the "([^"]*)" field should show that it is required at form level error$/) do |arg|
  AddAddress.new.verify_error_message_for_form_billing_address
end

# add for form level error for CR code

Then(/^the "([^"]*)" field should show that it is required as form level error message$/) do |arg|
  AddAddress.new.verify_error_message_cr_code
end

# add for form level no error for postal code

And(/^the "([^"]*)" field should show that it is not required at form level$/) do |arg|
  AddAddress.new.verify_error_message_postal_code_optional
end


# add for form level error for postal code

Then(/^the "([^"]*)" field should show that it is required at form level$/) do |arg|
  AddAddress.new.verify_error_message_postal_code_required
end

# add for form level no error for vat id

And(/^the "([^"]*)" field should show that it is not required at form level and no error$/) do |arg|
  AddAddress.new.verify_error_message_vat_id_optional
end

Then(/^I should see the Ultimate Destination section$/) do
  AddAddress.new.ultimate_destination_text
end

Then(/^I should see the international trade compliance message$/) do
  AddAddress.new.international_trade_compliance_message
end


