When(/^I (?:have )?log(?:ged)? in as an Arrow customer$/) do
  HomePage.open_page
  Header.login_link.click
  LoginPage.new.login
end


And(/^I visit Login Page$/) do
  LoginPage.open_page
end

Then(/^I have an option to Select Southern Europe$/) do
  LoginPage.new.region_selector.verify_text 'Southern Europe'
end

Then(/^I navigate to the Customer Login Page$/) do
  Header.login_link.verify_visible.click
end

And(/^I can see the Login Signup Menu's Login Button$/) do
  LoginSignupMenu.login_btn.verify_visible
end

And(/^I can see the Login Signup Menu's Register Button$/) do
  LoginSignupMenu.register_btn.verify_visible
end


Then(/^I can select my region$/) do
  RegionSelectModalPage.new.select_region('americas')
  $driver.verify_url 'region=na'
end

When(/^I log in as an Arrow customer who\'s chosen a region$/) do
  HomePage.open_page
  Header.login_link.click
  LoginPage.login_to_my_arrow_region('Americas', FigNewton.username, FigNewton.password)
end

Then(/^I am not asked to select my region$/) do
  $driver.verify_url 'region=na'
end

And(/^I click My arrow in the header$/) do
  LoginPage.new.select_my_arrow_login
end


Then(/^I can select "([^"]*)"$/) do |arg|
  RegionSelectModal.new.select_region(arg)
end


Then(/^I should not be prompted to enter my region again$/) do
  $driver.verify_url("#{FigNewton.components_url}/part/search/1?region=na")
end


Then(/^I log in as a user with the Region "([^"]*)" selected$/) do |region_text|
  LoginPage.new.login_to_my_arrow_region(region_text, FigNewton.username, FigNewton.password)
end

# add for ARW-3836

Then(/^I cannot see the radio buttons$/) do
  LoginPage.new.verify_no_radio_buttons
end

# add for login splash page

When(/^I can login with MyArrow user$/) do
  LoginPage.new.login(username=FigNewton.myArrowUsername, password=FigNewton.myArrowUserPassword)
end

Then(/^I can see the new Login Splash Page$/) do
  LoginSplashPage.new.verify_login_splash_page
  LoginSplashPage.new.verify_login_links
  LoginSplashPage.new.verify_region_selector
end


When(/^I click the "([^"]*)" button on the splash page$/) do |arg|
  LoginSplashPage.new.go_to_my_arrow_button.click
end


When(/^I click the "([^"]*)" button on the splash page to be on arrow$/) do |arg|
  LoginSplashPage.new.go_to_arrow_com_button.click
end

Then(/^I am logged in and returned to the search results page$/) do
  LoginSplashPage.new.verify_logged_in
end


When(/^I click the Login button and select region "([^"]*)"$/) do |arg|
  LoginSplashPage.new.select_region(arg)
end

Then(/^I am logged in and redirected to the components "([^"]*)" page$/) do |arg|
  LoginSplashPage.new.verify_region(arg)
end