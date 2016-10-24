When(/^I choose to never display the tour bar again$/) do
  FirstTimeUserExperience.never_btn.verify_visible.click
end

When(/^I choose to delay the tour$/) do
  FirstTimeUserExperience.not_now_btn.verify_visible.click
end

Given(/^I click to see the First Time user Experience$/) do
  FirstTimeUserExperience.yes_explore_btn.verify_visible.click
end

When(/^I click to start the First Time User Experience$/) do
  FirstTimeUserExperience.start_tour_btn.verify_visible.click
end

Then(/^The First Time User Experience Bar is not visible$/) do
  FirstTimeUserExperience.yes_explore_btn.verify_not_visible
end

Then(/^The First Time User Experience Bar is visible$/) do
  FirstTimeUserExperience.yes_explore_btn.verify_visible
end

Then(/^I am taken to Tutorial "([^"]*)"$/) do |tutorial_no|
  FirstTimeUserExperience.new.verify_tutorial_step tutorial_no
end

Then(/^I can see the Mobile First Time User Experience Carousel$/) do
  FirstTimeUserExperience.mob_first_time_user_exp_carousel.verify_visible
end

Given(/^I have waited "([^"]*)" seconds$/) do |seconds_to_wait|
  sleep seconds_to_wait
end