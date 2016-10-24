Then(/^I can see that the currency is set to USD by default$/) do
  CurrencyCodeDropDown.new.currency_code.verify_text("USD")
end


When(/^I return to the site later$/) do
  $driver.get "http://www.google.com"
  HomePage.open_page
end

Then(/^The Currency text displayed in the header is "([^"]*)"$/) do |currency_text|
  CurrencyCodeDropDown.new.currency_code.verify_text currency_text
end

And(/^I (?:can )?change the currency$/) do
  CurrencyCodeDropDown.new.change_currency "AUD"
end

Then(/^The Currency Codes drop-down is NOT visible$/) do
  CurrencyCodeDropDown.new.currency_drop_down.verify_not_visible
end

When(/^I click on the Currency in the Header$/) do
  CurrencyCodeDropDown.new.click_on_currency_code
end

When(/^I select the Currency "([^"]*)"$/) do |new_currency|
  CurrencyCodeDropDown.new.change_currency new_currency
end


And(/^The default Currency Symbol is "([^"]*)"$/) do |default_symbol|
  CurrencyCodeDropDown.new.currency_drop_down.verify_visible
  CurrencyCodeDropDown.new.default_currency_symbol.verify_text default_symbol
end

And(/^The default Currency Text is "([^"]*)"$/) do |default_currency|
  CurrencyCodeDropDown.new.currency_drop_down.verify_visible
  CurrencyCodeDropDown.new.current_currency_description.verify_text default_currency
end

And(/^The selected Currency Code is "([^"]*)"$/) do |selected_currency|
  CurrencyCodeDropDown.new.get_selected_currency.currency_name.verify_text selected_currency
end

And(/^List of foreign currency displays$/) do
  CurrencyCodeDropDown.new.currency_codes.verify_count_greater_than 1
end

And(/^Each Currency has a Code, Value and Currency Symbol$/) do
  CurrencyCodeDropDown.new.currency_codes.each { |currency|
    currency.currency_name.verify_visible
    currency.currency_symbol.verify_visible}
end


And(/^The Currency drop\-down is NOT visible$/) do
  CurrencyCodeDropDown.new.verify_currency_drop_down_not_visible
end

Then(/^The Currency Codes drop\-down is visible$/) do
  CurrencyCodeDropDown.new.verify_currency_drop_down_visible
end

And(/^The default Currency Symbol is \$$/) do
  CurrencyCodeDropDown.new.get_selected_symbol"$"
end

And(/^The default Currency Text is USD$/) do
  CurrencyCodeDropDown.new.get_selected_description"USD"
end

And(/^A List of foreign currency displays$/) do
  CurrencyCodeDropDown.new.new_currency_codes.verify_count_greater_than 1
end

And(/^All Currency has a Code, Value and Currency Symbol$/) do
    CurrencyCodeDropDown.new.new_currency_codes.each { |currency|
      currency.currency_name.verify_visible
      currency.currency_symbol.verify_visible}
  end