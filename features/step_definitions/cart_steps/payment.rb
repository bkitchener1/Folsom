Given(/^I visit the payment page$/) do
  step 'I have an item in my cart'
  step 'I click the checkout button'
  step 'I log in with the default user'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the default shipping method'
  step 'I click the checkout button'
end

Given(/^I visit the payment page as a terms user$/) do
  step 'I log in with the terms user'
  step 'I have an item in my cart'
  step 'I click the checkout button'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the default shipping method'
  step 'I click the checkout button'
end

When(/^I enter a test "([^"]*)" card$/) do |arg|
  page = Payment.new
  page.enter_payment("Credit Card","John T Birkenstock", "4111 1111 1111 1111", "123", "10 - October", "2018")
end

When(/^I select "([^"]*)" payment type$/) do |arg|
  page = Payment.new
  page.payment_method.select_by(:text,arg)
end

Then(/^I should see the wire transfer fee message$/) do
  page = Payment.new
  page.wire_message.verify_text("There will be a $25 wire transfer fee added to your total.")
end


And(/^I enter a Terms PO of "([^"]*)"$/) do |arg|
  page = Payment.new
  page.terms_po.send_keys(arg)
end

# Added a wait for COP-28

And(/^I select the default address$/) do
  page = ShippingAddress.new
  page.add_address.verify_present
  if not page.address_is_present? ("123 S Colorado")
    step 'I click the add new address link'
    step 'I enter "Test User" into field "name"'
    step 'I enter "Arrow" into field "company"'
    step 'I enter "3033122135" into field "phone"'
    step 'I select "United States of America" as the country'
    step 'I enter "123 S Colorado" into field "address"'
    step 'I enter "Denver" into field "city"'
    step 'I enter "80113" into field "zip"'
    step 'I enter "automation_user@aspenware.com" into field "email"'
    step 'I click update'
  end
  page.existing_address.verify_present
  page.wait_until do
  page.existing_address.where(:text,"123 S Colorado").first.click
  end
  end

When(/^I click Payment Method$/) do
  Payment.new.select_payment_methods
end

Then(/^Credit Card, PayPal, Arrange, and Wire Transfer should be available options$/) do
  Payment.new.available_payment_methods
end

And(/^Payment method icons should be present$/) do
  Payment.new.check_payment_icons
end

Then(/^The Credit Card form should be displayed$/) do
  Payment.new.verify_creditcard_form

end

When(/^I enter "([^"]*)" in the Card Number field$/) do |arg|
  Payment.new.enter_card_number(arg)
end

Then(/^Only "([^"]*)" should be displayed in Card Number field$/) do |arg|
  Payment.new.verify_card_text(arg)
end

When(/^I enter "([^"]*)" in the CCV field$/) do |arg|
  Payment.new.enter_ccv_number(arg)
end

Then(/^Only "([^"]*)" should be displayed in CCV field$/) do |arg|
  Payment.new.verify_ccv_text(arg)
end


Then(/^I enter in "([^"]*)" into the name field$/) do |arg|
  Payment.new.enter_name(arg)
end

When(/^I go back to payment page$/) do
  ShippingAddress.new.click_step_3
end


And(/^the CV code should be "([^"]*)"$/) do |arg|
  Payment.new.verify_ccv_text(arg)
end

When(/^I click into the Credit card number$/) do
  Payment.new.click_credit_number
end

Then(/^The Credit card number should display as "([^"]*)"$/) do |arg|
  Payment.new.verify_fake_card_text(arg)
end


Then(/^I should see all fields highlighted in red$/) do
  Payment.new.credit_card_red
end

And(/^receive an error specifying each field that needs to have information entered$/) do
  Payment.new.required_error_text
end

Then(/^Credit Card, PayPal, Terms, Arrange, and Wire Transfer should be available payment options$/) do
  Payment.new.payment_methods_terms
end

Then(/^The Credit card should display as "([^"]*)"$/) do |arg|
  Payment.new.verify_card_text(arg)
end

Then(/^I should see text telling me customer service will contact me$/) do
  Payment.new.arrange_text
end

And(/^A note informing me of a possible delay in shipping$/) do
  Payment.new.delay_shipping_text
end

And(/^A link to a wire transfer document should be present$/) do
  Payment.new.verify_wireless_instructions
end


Then(/^I should see a terms agreement message$/) do
  Payment.new.verify_terms_agreement
end


And(/^a PO number field$/) do
  Payment.new.verify_po_field
end

Then(/^I should see my PO number listed as "([^"]*)" in the summary screen$/) do |arg|
  Payment.new.verify_sum_po(arg)
end

Then(/^I should see an error message telling me I have no picked a valid terms address$/) do
  Payment.new.verify_term_shipping_error
end

When(/^I enter a Visa card$/) do
  Payment.new.enter_payment("Credit Card", FigNewton.credit_cards.visa.name, FigNewton.credit_cards.visa.number, FigNewton.credit_cards.visa.code, FigNewton.credit_cards.visa.month, FigNewton.credit_cards.visa.year.to_s)
end

When(/^I enter a Master card$/) do
  Payment.new.enter_payment("Credit Card", FigNewton.credit_cards.mastercard.name, FigNewton.credit_cards.mastercard.number, FigNewton.credit_cards.mastercard.code, FigNewton.credit_cards.mastercard.month, FigNewton.credit_cards.mastercard.year.to_s)
end

When(/^I enter a AMEX card$/) do
  Payment.new.enter_payment("Credit Card", FigNewton.credit_cards.amex.name, FigNewton.credit_cards.amex.number, FigNewton.credit_cards.amex.code, FigNewton.credit_cards.amex.month, FigNewton.credit_cards.amex.year)
end

When(/^I enter a Discover card$/) do
  Payment.new.enter_payment("Credit Card", FigNewton.credit_cards.discover.name, FigNewton.credit_cards.discover.number, FigNewton.credit_cards.discover.code, FigNewton.credit_cards.discover.month, FigNewton.credit_cards.discover.year.to_s)
end

When(/^I enter a EXPIRED credit card$/) do
  Payment.new.enter_payment("Credit Card", FigNewton.credit_cards.expired.name, FigNewton.credit_cards.expired.number, FigNewton.credit_cards.expired.code, FigNewton.credit_cards.expired.month, FigNewton.credit_cards.expired.year.to_s)
end

Then(/^I should receive an error telling me the card is expired$/) do
  Payment.new.verify_cc_expired_error
end

# added for COP-26
Then(/^Credit Card should be only available option$/) do
  Payment.new.verify_payment_method
end

# added for COP-26
And(/^credit card Payment method icons should be present$/) do
  Payment.new.verify_only_credit_card_icons
end

# added for COP-26

And(/^I should see informational message "Only Credit Card Payments are allowed for Non\-USD currencies\."$/) do
  Payment.new.verify_message_nonus
end

And(/^I click the "([^"]*)" Icon$/) do |arg|
  Payment.new.click_payment_icon(arg)
end

Then(/^The Payment Method drop down should set to "([^"]*)"$/) do |arg|
  @payment_method= Payment.new.payment_method_text
  expect(@payment_method).to eq (arg)
end


Then(/^The available payment method and icons should changed depending on (.*)$/) do |currency|
  Payment.new.verify_cur_accepted_payment(currency)
end