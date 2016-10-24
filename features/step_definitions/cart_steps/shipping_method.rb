Then(/^I should be on the shipping method page$/) do
  page = ShippingMethod.new
  page.verify_page
end

And(/^I select the default shipping method$/) do
  ShippingMethod.new.shipping_type(FigNewton.shipping_methods.fedex.ground.to_s)
end

When(/^I select shipping method "([^"]*)"$/) do |arg|
  page = ShippingMethod.new
  option = Selenium::WebDriver::Support::Select.new(page.shipping.element)
  option.select_by(:text, arg)
end

Then(/^the order summary should display a total of "([^"]*)"$/) do |arg|
  page = ShippingMethod.new
  page.order_summary.expand_mobile_order_summary
  page.order_summary.total.verify_text arg
end

And(/^The order summary should display a shipping charge of "([^"]*)"$/) do |arg|
  page = ShippingMethod.new
  if $size == "mobile" or $size == "tablet"
    page.order_summary.order_summary_toggle.verify_visible
    page.order_summary.order_summary_toggle.click
  end
  page.order_summary.shipping_total.verify_text arg
end


Given(/^I visit the shipping method page$/) do
  step "I have an item in my cart"
  step "I click the checkout button"
  step "I log in with the default user"
  step "I have already added an address"
  step "I select the default address"
  step "I click the checkout button"
end

# Adding step for COP-28
Given(/^I select the shipping method$/) do
  page = ShippingMethod.new
  ShippingMethod.new.shipping_type_us(FigNewton.shipping_methods.fedex.ground.to_s)
end

# adding step for COP-28
And(/^I select the shipping method for Non-US origin$/) do
  ShippingMethod.new.shipping_type_non_us(FigNewton.shipping_methods_non_us.dhl.express_world_wide_service.to_s)
end

When(/^I delete all addresses$/) do
  while ShippingAddress.new.first_trash.present? do
    ShippingAddress.new.delete_first_add
  end
end

Then(/^I should see a tab showing me "([^"]*)"$/) do |arg|
  ShippingMethod.new.origin_tab_text(arg)
end

And(/^"([^"]*)" line with a hide\/show all option should be seen$/) do |arg|
  ShippingMethod.new.ships_from_text(arg)
end

And(/^Use Own Shipping account option should be shown$/) do
  ShippingMethod.new.use_own_shipping_present
end

And(/^The US shipping method should default to "([^"]*)"$/) do |arg|
  @selected = ShippingMethod.new.verify_us_shipping_default
  expect(@selected).to eq (arg)
end

Then(/^A error should appear stating "([^"]*)"$/) do |arg|
  ShippingMethod.new.verify_error_text(arg)
end

When(/^I select the use my own US shipping method$/) do
  ShippingMethod.new.click_own_us_shipping
end

And(/^A field for me to enter my account number should appear$/) do
  ShippingMethod.new.verify_us_account_field
end

Given(/^I visit the shipping method page with a non\-US product$/) do
  step 'I visit the arrow website'
  step 'I add non-US "1000" items with part number "E02:0323_03825209" and source "EUROPE"'
  step 'I visit the cart summary page'
  step 'I click the checkout button'
  step 'I log in with the default user'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
end

And(/^All US prices should be removed from the shipping methods$/) do
  @shippingtext = ShippingMethod.new.get_us_shipping_text
  expect(@shippingtext).to eq ("Please select a shipping method\nGround Service (1 to 5 Days)\nExpress Saver\n2Day\nStandard Overnight - Next Bus.Day AfterN\nPriority - Next Business Day Morning\nFirst Overnight\nGround\n3 Day Select\n2nd Day Air\nNext Day Air Saver\nNext Day Air\nNext Day Air Early A.M.\n1st Class Mail\nPriority Mail\nPriority Express")
end


And(/^All non\-US prices should be removed from the shipping methods$/) do
  @shippingtext = ShippingMethod.new.get_non_us_shipping_text
  expect(@shippingtext).to eq ("Please select a shipping method\nExpress World Wide Service\nInternational Economy\nInternational Priority\nWorld Wide Expedited(D-based on Country)\nWorld Wide Express Plus\nWorld Wide Saver(1-3Dy after noon)\nWorld Wide Express")
end

And(/^The non\-US shipping method should default to "([^"]*)"$/) do |arg|
  @selected = ShippingMethod.new.verify_non_us_shipping_default
  expect(@selected).to eq (arg)
end

When(/^I select the use my own non\-US shipping method$/) do
  ShippingMethod.new.click_own_non_us_shipping
end

And(/^The non\-US item should show ships from "([^"]*)" at the item level$/) do |arg|
  @shipsfrom= ShippingMethod.new.non_us_item_ships_from_text
  expect(@shipsfrom).to eq (arg)
end

And(/^The non\-US item should show a Est\. Ship date$/) do
  ShippingMethod.new.non_us_item_est_ship_present
end


And(/^The non\-US item should show a Est\. Delivery date$/) do
  ShippingMethod.new.non_us_item_est_del_present
end

And(/^The US item should show ships from "([^"]*)" at the item level$/) do |arg|
  @shipsfrom= ShippingMethod.new.us_item_ships_from_text
  expect(@shipsfrom).to eq (arg)
end

And(/^The US item should show a Est\. Ship date$/) do
  ShippingMethod.new.us_item_est_ship_present
end

And(/^The US item should show a Est\. Delivery date$/) do
  ShippingMethod.new.us_item_est_del_present
end


Then(/^The shipping method page should appear correctly in "([^"]*)" when I have a US item in cart$/) do |language|
  ShippingMethod.new.verify_language_us_item(language)
end

Then(/^An error appears if I have not selected a shipping method in the "([^"]*)" language$/) do |language|
    ShippingMethod.new.verify_error_text(FigNewton.translation.send(language).shipping_method.select_ship_error.to_s)
end

Then(/^An error appears if I have not entered an account number in the "([^"]*)" language$/) do |language|
    ShippingMethod.new.verify_error_text(FigNewton.translation.send(language).shipping_method.enter_account_num_error.to_s)
end


Then(/^The shipping method page should appear correctly in "([^"]*)" when I have a nonUS item in cart$/) do |arg|
  ShippingMethod.new.verify_language_non_us_item(arg)
end

When(/^I return to the Arrow Home page$/) do
  ShippingMethod.new.click_arrow_icon
end