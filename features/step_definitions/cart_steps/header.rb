Then(/^The arrow header should be visible$/) do
  page = ArrowHeader.new
  page.verify_visible
end

Then(/^The cart header should be visible$/) do
  page = CartHeader.new
  page.verify_visible
end

When(/^I log out from the cart page$/) do
  page = CartHeader.new
  page.logout
end

Then(/^I should not be logged in$/) do
  page = ArrowHeader.new
  page.avatar.verify_not_visible
end

Then(/^I should be logged in$/) do
  page = ArrowHeader.new
  page.avatar.verify_visible
end

When(/^I log out from arrow\.com$/) do
  $driver.get FigNewton.base_url
  page = ArrowHeader.new
  page.logout
end

Then(/^I should not be logged in to the cart$/) do
  page = CartHeader.new
  page.verify_not_logged_in
end

And(/^the header cart icon should display "([^"]*)" items$/) do |arg|
  page = CartHeader.new
  if $size != "mobile"
    page.cart_red_dot.verify_text arg
  end
end

When(/^I change the currency to "([^"]*)"$/) do |arg|
  page = ArrowHeader.new
  page.select_currency(arg)
end


When(/^I change language to "([^"]*)"$/) do |arg|
  page = CartHeader.new
  page.switch_language(arg)
end

And(/^I click the header cart icon$/) do
  page = ArrowHeader.new
  page.cart.click
end

And(/^I click the qacart header cart icon$/) do
  page = CartHeader.new
  page.cart.click
end

Then(/^the currency should display "([^"]*)"$/) do |arg|
  ArrowHeader.new.verify_currency arg
end

And(/^I click the View Cart button$/) do
  sleep(2)
  CartHeader.new.click_view_cart_btn
end

When(/^I add an item through a vendor site$/) do
  $driver.get("#{$base_url}/cart?vendorId=fd0ab6ff6ef84502a8d8886b442d81d4")
end

Then(/^The vendor ID should appear in the header$/) do
  CartHeader.new.wait_until(5){
    CartHeader.new.silicon_image_present}
end

