Given(/^I visit the Engineers Listings Page$/) do
  EngineersListingPage.open_page
end

Given(/^I visit an Engineer's Profile$/) do
  EngineersListingPage.open_page
  EngineersListingPage.open_engineers_profile
end

When(/^I am sending an email to an engineer$/) do
  EngineersListingPage.open_page.email_engineer
end

And(/^I change my mind$/) do
  sleep 2
  EmailAnEngineerModalPage.new.cancel_sending_email
end

Then(/^I can cancel sending$/) do
  EngineersListingPage.new.email_modal_container.verify_not_visible
end

And(/^I do not provide all required information$/) do
  EmailAnEngineerModalPage.new.submit_form
end

Then(/^I am informed of the errors the I need to correct$/) do
  EmailAnEngineerModalPage.new.error_container.verify_visible
end

Then(/^I can see the Engineer'?s Availability$/) do
  EngineersListingPage.new.availability_indicator.verify_visible
end

Then(/^I CANNOT see the Engineer'?s Availability$/) do
  EngineersListingPage.new.availability_indicator.verify_not_visible
end

Then(/^I can see options for support with (\d*) options icons/) do |no_of_options|
  EngineersListingPage.new.verify_header_hero_is_displayed
  EngineersListingPage.new.hero_header_cta_container.verify_count(no_of_options)

end

Then(/^I can see a Grid of Engineers$/) do
  EngineersListingPage.new.person_squares.verify_visible
end

And(/^I can see at least "([^"]*)" Engineer$/) do |min|
  EngineersListingPage.new.person_squares.verify_count_greater_than min
end

Then(/^I can see offline and online engineers$/) do
  expect(EngineersListingPage.new.all_engineers_displayed?).to be_truthy, 'All engineers showing offline / No engineers displayed'
end

Then(/^I can see "([^"]*)" Engineers$/) do |max|
  EngineersListingPage.person_squares.verify_count(max)
end

When(/^I Load More Engineers$/) do
  EngineersListingPage.load_more_engineers.click
end

Then(/^I can see the Engineers Name$/) do
  EngineersListingPage.email_engineer_buttons.verify_visible
end

And(/^I can see a Button to message the Engineer$/) do
  EngineersListingPage.message_engineer_btn.verify_visible
end

When(/^I hover over the Engineer Profile$/) do
  PersonSquare.new.hover_over_engineer
end

Then(/^I can see up to "([^"]*)" Tags related to the Engineer$/) do |max|
  EngineersListingPage.new.person_squares.first.engineers_tags.verify_count_less_than(max.to_i + 1)
end


And(/^I can see a Button that directs to the Engineer's Profile Page$/) do
  PersonSquare.new.view_profile_btn.verify_visible
end

And(/^I can see that the Engineer's Profile has a background Image$/) do
  EngineersListingPage.new.person_squares.first.verify_style('background-image','images/engineer-chat')
end

Then(/^I can send an email to (?:the|an) engineer$/) do
  EngineersListingPage.new.email_engineer
  EmailAnEngineerModalPage.new.send_email
  EmailAnEngineerModalPage.new.verify_form_completed
end
