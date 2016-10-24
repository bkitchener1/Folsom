And(/^I log in with user "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  LoginPage.new.login(arg1, arg2)
end

Given(/^I log in with the default user$/) do
  LoginPage.new.login(FigNewton.default_user.username, FigNewton.default_user.password)
end

Given(/^I visit the arrow login page$/) do
  LoginPage.open_page
end

And(/^I login to arrow\.com$/) do
    LoginPage.open_page.login(FigNewton.default_user.username, FigNewton.default_user.password)
end


And(/^I am logged in$/) do
  LoginPage.open_page.login(FigNewton.default_user.username, FigNewton.default_user.password)
end

Given(/^I log in with the terms user$/) do
    environments = ["cms.arrow.com", "cart.arrow.com","hkg.arrow.com","ord.arrow.com","lon.arrow.com"]
    environments.each do |env|
      if $driver.current_url.include? env
        raise Cucumber::Core::Test::Result::Skipped, "Skipping Scenario"
      end
    end
  LoginPage.open_page.login(FigNewton.terms_user.username, FigNewton.terms_user.password)
end

Given(/^I log in with the second user$/) do
  LoginPage.open_page.login(FigNewton.second_user.username, FigNewton.second_user.password)
end

Given(/^I log in with the third user$/) do
  LoginPage.open_page.login(FigNewton.third_user.username, FigNewton.third_user.password)
end


When(/^I click on the create account link$/) do
  LoginPage.new.click_create_account
end