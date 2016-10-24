When(/^I visit the Cookie Terms and Conditions page$/) do
 CookieTermsAndConditionsPage.open_page
end

Then(/^I should be able to view the full cookie policy page$/) do
  CookieTermsAndConditionsPage.new.selected_sidebar_option.verify_attribute('href','cookie-policy')
end