When(/^I select existing address "([^"]*)"$/) do |arg|
  ShippingAddress.new.select_address(arg)
end

When(/^I click the add new address link$/) do
  ShippingAddress.new.add_address.click
end

And(/^I delete existing address "([^"]*)"$/) do |arg|
  ShippingAddress.new.delete_address(arg)
end

# commenting wait as the verification is for not present

Then(/^the address "([^"]*)" should not be present$/) do |arg|
  page = ShippingAddress.new
  #page.wait_until() do
    not page.address_is_present? arg
  end
#end


When(/^I edit existing address "([^"]*)"$/) do |arg|
  page = ShippingAddress.new
  page.edit_address(arg)
end

And(/^the address "([^"]*)" should be present$/) do |arg|
  page = ShippingAddress.new
  page.wait_until() do
    page.address_is_present? arg
  end
end

#added new field via step - And I select address type "0"

When(/^I select the first address$/) do
  page = ShippingAddress.new
  if page.no_address_text.displayed?
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
  else
    page.existing_address.verify_present.first.click
  end
end

Given(/^I visit the shipping address page$/) do
  step 'I have an item in my cart'
  step 'I click the checkout button'
   step 'I log in with the default user'
end

And(/^I should be on the shipping address page$/) do
  ShippingAddress.new.verify_visible
end

And(/^I finish checking out$/) do
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I should be able to submit my order'
end

And(/^I do not select an address$/) do
  page = ShippingAddress.new
end

Given(/^I visit the add new shipping address modal$/) do
  step 'I visit the shipping address page'
  step 'I click the add new address link'
end

When(/^I click the update button$/) do
  AddAddress.new.update.click
end

Then(/^I should see the delete item modal with confirmation text$/) do
  ShippingAddress.new.delete_address_modal.verify_modal
end

Then(/^I should see a Message saying you do not have any address on file should be present$/) do
  ShippingAddress.new.no_address
end

And(/^the Add New Address button should be present$/) do
  ShippingAddress.new.add_address.verify_visible
end

And(/^I visit step one$/) do
  ShippingAddress.open_page
end

And(/^I visit the Shipping Address page$/) do
  ShippingAddress.open_page
end

When(/^I click the continue checkout button$/) do
  ShippingAddress.new.click_continue_checkout
end

Then(/^I should see an error message telling me to select an address$/) do
  ShippingAddress.new.verify_select_address_error("You must select an address")
end

And(/^I have added (\d+) addresses$/) do |arg|
  shipping_page = ShippingAddress.new
  while shipping_page.existing_address.count < arg.to_i do
    shipping_page.add_address.click()
    AddAddress.new.add_address("0","Test User","ARROW","555-555-5555","United States of America","555 Street Ave","","Denver","Colorado","80222","testuser@mailinator.com")
  end
end

Then(/^the addresses should display in the correct layout$/) do
  address_page = ShippingAddress.new
  y = address_page.existing_address.first.location.y
  count = 0
  address_page.existing_address.each { |address|
    if address.location.y == y
      count += 1
    end}
  if $size == "desktop"
    if count != 3
      raise "Style not correct.  There should be 3 columns in desktop layout not #{count}"
    end
  elsif $size == "mobile"
    if count != 1
      raise "Style not correct, there should only be 1 column in mobile layout not #{count}"
    end
  elsif $size == "tablet"
    if count != 2
      raise "Style not correct, there should only be 2 columns in tablet layout not #{count}"
    end
  else
    raise "$size is not supported: #{$size}"
  end
end

Then(/^the default address should be selected and highlighted$/) do
  ShippingAddress.new.verify_address_selected("123 S Colorado")
end

And(/^I have an address from the UK$/) do
  if ShippingAddress.new.existing_address.where(:text,"United Kingdom").count == 0
    print "Couldn't find a UK address"
    ShippingAddress.new.add_address.click
    AddAddress.new.add_address("0","UK User", "ARROW", "2123-231-123", "United Kingdom", "12345 UK Road","","London","State","21323","tester@mailinator.com",NIL,"GBGD001")
  end
end

Then(/^the address from the UK should display VAT ID "([^"]*)"$/) do |arg|
  ShippingAddress.new.existing_address.where(:text,"United Kingdom").first.vat_id.verify_text(arg)
end

Then(/^I should see a terms address$/) do
  if (ShippingAddress.new.existing_address.where(:text,"Terms Approved Address").count == 0)
    raise "Could not find a terms address"
  end
end

When(/^I click the trash can icon on the first address$/) do
  ShippingAddress.new.existing_address.first.trash.click
end

Then(/^The Shipping Address page should display correctly in "([^"]*)"$/) do |language|
  if language == "english"
    @text= "Shipping Address"
  elsif language == "german"
    @text= "Lieferadresse"
  elsif language == "chinese"
    @text= "付运地址"
  elsif language == "french"
    @text= "Adresse d’expédition"
  elsif language == "italian"
    @text= "Indirizzo di spedizione"
  elsif language == "spanish"
    @text= "Dirección de envío"
  end
  ShippingAddress.new.verify_language(@text)
end

# address_type new field on shipping address
# to select direct consumer in the drop down

And(/^I select address type "([^"]*)"$/) do |arg|
    AddAddress.new.select_address_type_direct_consumer(arg)
end


# address_type new field on shipping address
# to select other options in address_type

And(/^I select address type for other options in drop down "([^"]*)"$/) do |arg|
  AddAddress.new.select_address_type(arg)
end

# to select freight forwarder shipping address

 When(/^I select freight forwarder shipping address"([^"]*)"$/) do
  page = ShippingAddress.new
  page.existing_address.verify_present.first.click
  page.select_address("Freight Forwarder")
  end