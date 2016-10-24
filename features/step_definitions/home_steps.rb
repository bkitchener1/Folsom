Then(/^the divisions pages should load without exceptions$/) do
    HomePage.new.check_divisions_pages
end

Given(/^I visit the Arrow Home Page$/) do
    HomePage.open_page
end

# added for COP-165

And(/^I click the Contact and Support link$/) do
    HomePage.new.contact_support_page
end

Then(/^OpinionLabs window url should display "([^"]*)"$/) do |arg1|
    HomePage.verify_feed_back_link(arg1)
end