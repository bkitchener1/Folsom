
Then(/^I should be able to submit my order$/) do
  page = PlaceOrder.new
  page.submit
end

And(/^The order summary should display a wire fee of "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
    page.order_summary.wire_transfer_total.verify_text arg
end


Then(/^I should be on the place order page$/) do
  page = PlaceOrder.new
    page.verify_visible
end

Then(/^I place my order$/) do
  page = PlaceOrder.new
    page.submit
end

And(/^I click the complete checkout button$/) do
  sleep 5
  page = PlaceOrder.new
  page.abort_if_prod
  page.submit_button.click
end

And(/^I enter promotional code "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
end

Then(/^I should see an error saying the PO \# is required$/) do
  Payment.new.verify_po_req_error
end


When(/^I clear the PO number$/) do
  Payment.new.clear_po_field
end

And(/^I should see an error saying the PO number is required for terms payments$/) do
  PlaceOrder.new.verify_po_req_error
end

And(/^a PO number field should be seen and be optional$/) do
  PlaceOrder.new.verify_po_field
end


# Adding step definition for COP-28

And(/^the place order page shipping method displays "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
  page.shipping_method.verify_text arg
end

# Adding step definition for COP-28

And(/^the place order page shipping method displays the shipping method selected earlier$/) do
  page = PlaceOrder.new
  us_value = ShippingMethod.shipping_method
  page.shipping_method_selected.verify_text us_value
end

# Adding step definition for COP-28

And(/^the place order page shipping method displays Non\-US "([^"]*)"$/) do |arg1|
  page = PlaceOrder.new
  page.shipping_method_international.verify_text arg1
end

# Adding step definition for COP-28

And(/^the place order page shipping method displays the shipping method selected earlier "([^"]*)"$/) do |arg2|
  page = PlaceOrder.new
  us_value = ShippingMethod.shipping_method
  page.shipping_method_selected.verify_text arg2
end

# Adding step definition for COP-28

And(/^the place order page shipping method displays the Non\-US shipping method selected earlier "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
  value = page.shipping_method_international.value
  non_us_value = ShippingMethod.shipping_method_non_us
  page.shipping_method_selected_non_us.verify_text arg
end

Given(/^I visit the Place Order page$/) do
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
end

#added for COP-29

Then(/^place order page shipping address should display "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
  page.verify_shipping_address_text(FigNewton.shipping_address_testuser.line1,FigNewton.shipping_address_testuser.line2,FigNewton.shipping_address_testuser.line3,FigNewton.shipping_address_testuser.line4,FigNewton.shipping_address_testuser.line6,FigNewton.shipping_address_testuser.line7)
end

#added for COP-27

Then(/^place order page payment method should display "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
page.verify_payment_method_text(FigNewton.payment_method.type,FigNewton.payment_method.name,FigNewton.payment_method.lastfour)
  page.verify_payment_method_text_expiration(arg)
end

Then(/^place order page billing address should display "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
  page.verify_billing_address_text(FigNewton.billing_address_testuser.name,FigNewton.billing_address_testuser.company_name,FigNewton.billing_address_testuser.address_line1,FigNewton.billing_address_testuser.address_line2,FigNewton.billing_address_testuser.address_line3,FigNewton.billing_address_testuser.address_line4)
end

# added for COP-27

Then(/^place order page billing address should display "([^"]*)" in the billing address field$/) do |arg|
  page = PlaceOrder.new
  page.verify_billing_add_optional(arg)
end

# added for COP-27

Then(/^the place order page payment section displays "([^"]*)" payment method$/) do |arg|
  page = PlaceOrder.new
  page.payment_details.verify_text(arg)
end

# added for COP-27
Then(/^the place order page payment section displays "([^"]*)"$/) do |arg|
  page = PlaceOrder.new
  page.payment_details.verify_text(arg)
end

# added for COP-27

Then(/^place order page payment link should display "([^"]*)"$/) do |arg|
  page =PlaceOrder.new
  page.verify_payment_link(arg)
end


Then(/^The cart header should be visible on the place order page$/) do
  CartHeader.new.verify_visible_po
end

# added for ARW-3599

Then(/^the place order page shipping address section displays ultimate consignee address$/) do
  page = PlaceOrder.new
  page.verify_ultimate_consignee_address
end