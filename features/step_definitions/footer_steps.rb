Then(/^The follow us module displays$/) do
  Footer.follow_us.verify_visible
end


Then(/^I can see the Footer$/) do
  Footer.footer.verify_visible
end

Then(/^I can see the Arrow image in the Footer Divisions section$/) do
  Footer.footer_divisions_logo.verify_visible
end

Then(/^I can see the Copyright text in the Footer's secondary section$/) do
  Footer.footer_secondary.verify_text "© #{Time.now.year} Arrow Electronics, Inc. All rights reserved"
end

Then(/^The Follow Us module has a "(.*?)" link with an href of "(.*?)"$/) do |arg1, arg2|
  Footer.new.verify_href(arg1,  arg2)
end

Then(/^I can see links in the Footer Divisions section$/) do
  Footer.footer_divisions_links.verify_count_greater_than 1
end

Then(/^I can see no more than "([^"]*)" links in the Footer Divisions section$/) do |arg|
  Footer.footer_divisions_links.verify_count_less_than (arg+1).to_i
end


Then(/^I can see a Read More Link in the Footer$/) do
  Footer.new.footer_read_more_link.verify_visible
end

And(/^The Read More Link in the Footer directs to "([^"]*)"$/) do |link_href|
   Footer.new.footer_read_more_link.verify_attribute('href', "#{$base_url}#{link_href}")
end

Then(/^I should see follow us on social media buttons in the footer$/) do
  Footer.new.verify_social
end

When(/^I click the follow us on Twitter button$/) do
  Footer.twitter.click
end

Then(/^I should be directed to the proper Arrow Twitter url$/) do
  $driver.switch_to_new_window
  $driver.verify_url"https://twitter.com/Arrow_dot_com"
  $driver.switch_to_default_window
end

And(/^I click the follow us on YouTube button$/) do
  Footer.youtube.click
end

Then(/^I should be directed to the proper Arrow YouTube url$/) do
  $driver.switch_to_new_window
  $driver.verify_url"https://www.youtube.com/channel/UCPyQ-SpXmUVEyEzC_4s4pQA"
  $driver.switch_to_default_window
end

And(/^I click the follow us on Facebook button$/) do
  Footer.facebook.click
end

Then(/^I should be directed to the proper Arrow Facebook url$/) do
  $driver.switch_to_new_window
  $driver.verify_url"https://www.facebook.com/ArrowDotCom"
  $driver.switch_to_default_window
end

And(/^I click the follow us on LinkedIn button$/) do
  Footer.linkedin.click
end

Then(/^I should be directed to the proper Arrow LinkedIn url$/) do
  $driver.switch_to_new_window
  $driver.verify_url"https://www.linkedin.com/company/arrow-electronics"
  $driver.switch_to_default_window
end

And(/^I click the follow us on Goggle\+ button$/) do
  Footer.google.click
end

Then(/^I should be directed to the proper Arrow Google\+ url$/) do
  $driver.switch_to_new_window
  $driver.verify_url"https://plus.google.com/+ArrowDotCom"
  $driver.switch_to_default_window
end