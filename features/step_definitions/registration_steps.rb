Then(/^I can create an account on checkout and log in$/) do
  LoginPage.new.create_account_link.click
  user = ShortCreateAccountPage.new.create_new_account
  LoginPage.open_page.login_to_arrow_site(user[:email], user[:password])
end

Then(/^I create an account$/) do
  HomePage.open_page
  Header.login_link.click
  LoginPage.create_account_link.click
  user = ShortCreateAccountPage.new.create_new_account
end

Then(/^I am automatically logged in after clicking ok$/) do
  ShortCreateAccountPage.new.click_to_login
  ArrowHeader.new.verify_logged_in
end

Then(/^I see a message telling me to log in$/) do
  ShortCreateAccountPage.new.click_to_goto_login_page
end


And(/^I select 'Arrow\.com' on the login page$/) do
  LoginPage.open_page.select_arrow_com_login
end

And(/^I select 'My Arrow' on the login page$/) do
  LoginPage.open_page.select_my_arrow_login
end

And(/^I click on Create Account on the login page$/) do
  LoginPage.new.create_account_link.click
end

When(/^I Log in to MyArrow$/) do
  LoginPage.open_page.create_account_link
  user = ShortCreateAccountPage.new.create_new_account
  LoginPage.open_page.select_my_arrow_login
  LoginPage.new.login_to_arrow_site(user[:uname], user[:pwd])
end

Then(/^I should be on the short registration form page$/) do
  ShortCreateAccountPage.new.full_name_field.verify_visible
  ShortCreateAccountPage.new.terms_of_use_link.verify_visible
  ShortCreateAccountPage.verify_fields
  ShortCreateAccountPage.full_name_field.verify_visible
  ShortCreateAccountPage.email_field.verify_visible
  ShortCreateAccountPage.password_field.verify_visible
end

Then(/^I can view the registration terms of use$/) do
  ShortCreateAccountPage.new.terms_of_use_link.click
  $driver.verify_new_window("terms-of-use")
end

Then(/^I can see Default Regions in the Dropdown$/) do
  LoginPage.region_selector.verify_visible
  LoginPage.region_selector.verify_text("Americas")
  LoginPage.region_selector.verify_text("Asia/Pacific")
  LoginPage.region_selector.verify_text("Central Europe")
  LoginPage.region_selector.verify_text("Northern Europe")
end

When(/^I Login in as an Arrow customer with the Region "([^"]*)" selected$/) do |region_text|
  HomePage.open_page
  Header.new.login_link.click
  LoginPage.new.login_to_my_arrow_region(region_text, FigNewton.username, FigNewton.password)
end


And(/^there is the ability to create an account$/) do
 # ShortCreateAccountPage.create_new_account(name =random_string, email_address="#{random_string}@mailinator.com", password="BI0Tester")
  ShortCreateAccountPage.full_name_field.send_keys random_string
  ShortCreateAccountPage.email_field.send_keys "#{random_string}@mailinator.com"
  ShortCreateAccountPage.password_field.send_keys "AUT0Tester"
  ShortCreateAccountPage.submit_registration.click
  ShortCreateAccountPage.modal_confirm_button.verify_present
  ShortCreateAccountPage.confirm_message.verify_text "Your account is now activated. To view or change your account information, click on the user icon in the header."

end

# add for ARW-851

Then(/^I am back on the cart summary page$/) do
  $driver.verify_url("#{FigNewton.base_url}/en/cart")
end

Then(/^I am back on the cart shipping address page$/) do
  $driver.verify_url("#{FigNewton.cart_url}/#/shipping_address")
end


Then(/^I can create an account on checkout and logged in$/) do
  LoginPage.new.create_account_link.click
  ShortCreateAccountPage.new.create_new_account
  ShortCreateAccountPage.modal_confirm_button.click
end