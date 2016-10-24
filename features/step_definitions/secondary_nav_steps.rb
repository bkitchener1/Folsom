Then(/^There is Secondary Navigation on the page$/) do
  SecondaryNav.secondary_nav.verify_visible
end

Then(/^The Secondary Nav Menu is NOT visible on the page$/) do
  SecondaryNav.secondary_nav.verify_not_visible
end

And(/^The Secondary Navigation has a Title$/) do
  SecondaryNav.discover.verify_visible
end

When(/^I click on the Main Secondary Navigation item$/) do
  SecondaryNav.discover
end

Then(/^The Secondary Nav Menu is visible on the page$/) do
  SecondaryNav.secondary_menu.verify_visible
end

And(/^The Secondary Navigation has a News icon and link$/) do
  channel_name = 'NEWS'
  SecondaryNav.news.verify_text channel_name
  SecondaryNav.news.verify_attribute("class","Icon Icon--#{channel_name.downcase}")
end

And(/^The Secondary Navigation has a Training & Events icon and link$/) do
  channel_name = 'TRAINING & EVENTS'
  expect(@news_events_page.get_secondary_link_text(@news_events_page.training_element)).to eq channel_name
  expect(@news_events_page.get_secondary_link_icon_class_name(@news_events_page.training_element)).to eq "Icon Icon--events"
end

And(/^The Secondary Navigation has a Videos icon and link$/) do
  channel_name = 'VIDEOS'
  expect(@news_events_page.get_secondary_link_text(@news_events_page.videos_element)).to eq channel_name
  expect(@news_events_page.get_secondary_link_icon_class_name(@news_events_page.videos_element)).to eq "Icon Icon--#{channel_name.downcase}"
end

And(/^The Secondary Navigation has a White Papers icon and link$/) do
  channel_name = 'WHITE PAPERS'
  expect(@news_events_page.get_secondary_link_text(@news_events_page.white_papers_element)).to eq channel_name
  expect(@news_events_page.get_secondary_link_icon_class_name(@news_events_page.white_papers_element)).to eq "Icon Icon--whitePapers"
end

And(/^I can see up to "([^"]*)" Secondary Nav Links$/) do |arg|
  SecondaryNav.new.secondary_nav_links.where(:displayed, true).verify_count arg
end

And(/^the Secondary Navigation is a dropdown$/) do
  SecondaryNav.new.dropdown_icon.verify_visible
end