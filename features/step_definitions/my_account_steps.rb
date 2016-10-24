Then(/^I am able see all links related to My account in the drop down$/) do
  HomePage.open_page
  MyAccountDropDown.new.verify_menu_contents_present
end

Then(/^I should be on the Order History page$/) do
  MyAccountDropDown.new.verify_order_history_load
end

Then(/^I should be on the Profile Settings page$/) do
  MyAccountDropDown.new.verify_profile_settings_load
end

Then(/^I should be on the Password reset page$/) do
  MyAccountDropDown.new.verify_change_password_load
end

When(/^I click the user icon in the header$/) do
  MyAccountDropDown.new.open_my_account_dropdown
end

When(/^I click "([^"]*)" in the My Accounts drop down$/) do |arg|
  MyAccountDropDown.new.click_my_account_option(arg)
end