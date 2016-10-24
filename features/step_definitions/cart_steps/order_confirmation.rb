Given(/^I have submitted an order$/) do
  step 'I have an item in my cart'
  step 'I submit my order'
end

Then(/^the order confirmation address should display "([^"]*)"$/) do |arg|
  page = Confirmation.new
  page.shipping_address.verify_text arg
end

Then(/^I see the order completed section and thank you text$/) do
  page = Confirmation.new
  page.order_completed.verify_visible
  page.thank_you_message.verify_text "Thank you! Your order has been placed. Please note that the estimated ship and delivery dates are shown in the Shopping Cart section below. Feel free to contact us if you have any questions or concerns."
end

Then(/^the order confirmation shipping method displays "([^"]*)"$/) do |arg|
  page = Confirmation.new
  page.shipping_method.verify_text arg
end

And(/^I submit my order$/) do
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the default shipping method'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I place my order'
  step 'I should be on the order confirmation page'
end



And(/^the order confirmation shipping method displays the shipping method selected earlier$/) do
  page = Confirmation.new
  us_value = ShippingMethod.shipping_method
  #non_us_value = ShippingMethod.shipping_method_non_us
  page.shipping_method.verify_text us_value
  #page.shipping_method.verify_text non_us_value
end

When(/^I should be on the order confirmation page/) do
  step 'I am on the correct confirmation page for my environment'
  page = Confirmation.new
  page.order_completed.verify_present(timeout=60)
end

Then(/^the order confirmation page displays the order number$/) do
  text = Confirmation.new.get_order_number()
  if text.empty?
   raise "Order Number was blank"
   end
end

Then(/^the confirmation page payment section displays "([^"]*)"$/) do |arg|
  page = Confirmation.new
  page.payment_details.verify_text arg
end

And(/^the confirmation page payment address displays "([^"]*)"$/) do |arg|
  page = Confirmation.new
  page.payment_address.verify_text arg

end

When(/^I click the View\/Print Wire Transfer Instructions link$/) do
  page = Confirmation.new
  page.wire_terms.verify_present.scroll_into_view
  $driver.scroll_down(500)
  page.wire_terms.click
end

When(/^the View\/Print Wire Transfer Instructions link should be "([^"]*)"$/) do |arg|
  page = Confirmation.new
  expect(page.wire_terms.verify_present.attribute("href")).to eq arg
end

Then(/^I should be on the confirmation page$/) do
  CartOrderSummary.new.continue.verify_not_visible
  Confirmation.new.verify_order_completed
end

Given(/^I visit the order confirmation page$/) do
  step 'I have an item in my cart'
  step 'I click the checkout button'
  step 'I log in with the default user'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the default shipping method'
  step 'I click the checkout button'
  step 'I enter a Visa card'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I am on the correct confirmation page for my environment'
end

# fix for paymentfeature

Then(/^the confirmation page payment section for paypal displays "([^"]*)"$/) do |arg|
  page = Confirmation.new
  page.payment_card_paypal_text.verify_text arg
end

# cart fix shipping method feature for us and non us origin

When(/^I submit my order for us and non us origin$/) do
  step 'I visit the cart summary page'
  step 'I check out'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the default shipping method'
  step 'I select the shipping method for Non-US origin'
  step 'I click the checkout button'
  step 'I enter a test "visa" card'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I place my order'
  step 'I should be on the order confirmation page'
end

# cart fix shipping method feature for non us origin

When(/^I submit my order for non-us origin$/) do
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
  step 'I place my order'
  step 'I should be on the order confirmation page'
end

And(/^I am on the correct confirmation page for my environment$/) do
  if not $driver.current_url.include? $base_url
    url = $driver.current_url.split("cart")[1]
    new_url = $base_url + "/cart" + url
    print new_url
    $driver.get new_url
  end
end

# add for ultimate consignee address

Then(/^the order confirmation address should display freight forwarder address$/) do
  page = Confirmation.new
  page.ultimate_destination.verify_text "Ultimate Destination
bill add
bill add
303-665-8901
1111 arrow
centennial, CO 80012
US
Direct Consumer"
end