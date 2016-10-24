
Given(/^I visit the Arrow Error Page$/) do
  ErrorPage.open_page
end

And(/^I can see an Error Header$/) do
  ErrorPage.error_page_title.verify_visible
end

And(/^I can see an Error Info$/) do
  ErrorPage.error_page_info.verify_visible
end

And(/^I can see useful Info to help me$/) do
  ErrorPage.error_page_useful.verify_visible
end