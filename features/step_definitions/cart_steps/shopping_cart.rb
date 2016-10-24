# Added fpr COP-28
Then(/^I have a shopping cart to place my order for US origin item$/) do
  step 'I have an item in my cart'
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I click the checkout button'
  step 'I select the shipping method'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
end

And(/^I have a shopping cart to place my order for Non-US origin item$/) do
  step 'I have a Non-US item in my cart'
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the shipping method for Non-US origin'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
end

And(/^I have a shopping cart to place my order with two products$/) do
  step 'I have two items in my cart'
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the shipping method'
  step 'I select the shipping method for Non-US origin'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
end

# to select freight forwarder shipping address

And(/^I select freight forwarder shipping address$/) do
  page = ShippingAddress.new
  page.existing_address.verify_present.first.click
  page.select_first_address("Freight Forwarder")
end

# add for ultimate consignee address

When(/^I have submitted an order with ultimate consignee address$/) do
  step 'I have an item in my cart'
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I click the add new address link'
  step 'I select address type "1" for Freight forwarder'
  step 'I enter "ult User" into field "name"'
  step 'I enter "Arrow" into field "company"'
  step 'I enter "3038901234" into field "phone"'
  step 'I select "United States of America" as the country'
  step 'I enter "111 arrow st" into field "address"'
  step 'I enter "Denver" into field "city"'
  step 'I enter "80112" into field "zip"'
  step 'I enter "automation_user@gmail.com" into field "email"'
  step 'I click update'
  step 'I select freight forwarder shipping address'
  step 'I click the checkout button'
  step 'I select the shipping method'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I place my order'
  step 'I should be on the order confirmation page'
end

And(/^I select address type "([^"]*)" for Freight forwarder$/) do |arg|
  # @address_type.click
  #@address_type.select
  AddAddress.new.select_address_type(2)
end

# add for order detail
Then (/^I navigate to order detail page$/) do
  order_no = Confirmation.new.get_order_number()
  #order_detail_page = $driver.navigate().to(FigNewton.base_url+"en/my-account/order-history/order-detail?orderID=#{order_no}"+"&emailAddress=#{FigNewton.default_user.username}")

  #https://qa.arrow.com/en/my-account/order-history/order-detail?orderID=WEB-SO1231399&emailAddress=christina.igo@gmail.com
  # above line of code will not work until we have a new QA server locally here which will be set up to have access to NAV to be able to view
  # order detail.  Until then, will comment above line, below line hardcoded for validation for now.
  # Login with this hardcoded user to be able to view order detail
  # end customer address in qa, in uat it is ultimate destination

  # logging out automation user

  Confirmation.new.user_icon_confirmation_page.click
  Confirmation.new.logout_confirmation_page.click

  # logging in a user where order detail can be viewed and validated

   loginpage = LoginPage.open_page
   loginpage.login("christina.igo@gmail.com", "aspenware1")
   order_detail_page = $driver.navigate().to(FigNewton.base_url+"/en/my-account/order-history/order-detail?orderID=WEB-SO1231399&emailAddress=christina.igo@gmail.com")
  page = OrderDetail.new

  # below validation will need to be updated when this works for automation user

  page.ultimate_destination_order_detail.verify_text "Ultimate Destination
  UC Name
UC Company
UC PHONE
UC Address
UC City, AL UC POSTAL CODE, US
Direct Consumer"

  #Below code to be uncommented when order detail works fine
  #until we have a new QA server locally here which will be set up to have access to NAV to be able to view
  # order detail.  Until then, will comment below code

  #page.ultimate_destination_order_detail.verify_text "Ultimate Destination
#bill add
#bill add
#303-665-8901
#1111 arrow
#centennial, CO 80012
#US
#Direct Consumer"

end

# add for ultimate consignee address on order detail page

When(/^I have submitted an order with ultimate consignee address for order detail$/) do
  step 'I have an item in my cart'
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I click the add new address link'
  step 'I select address type "1" for Freight forwarder'
  step 'I enter "ult User" into field "name"'
  step 'I enter "Arrow" into field "company"'
  step 'I enter "3038901234" into field "phone"'
  step 'I select "United States of America" as the country'
  step 'I enter "111 arrow st" into field "address"'
  step 'I enter "Denver" into field "city"'
  step 'I enter "80112" into field "zip"'
  step 'I enter "automation_user@gmail.com" into field "email"'
  step 'I click update'
  step 'I select freight forwarder shipping address'
  step 'I click the checkout button'
  step 'I select the shipping method'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I place my order'
  step 'I should be on the order confirmation page'
  step 'I navigate to order detail page'

end




