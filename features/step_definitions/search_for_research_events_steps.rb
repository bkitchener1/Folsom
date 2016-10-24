Given(/^I (?:search|have searched) the Arrow site for Research and Events "(.*?)"$/) do |search_s|
  @search_term = search_s
  search_param = "q=#{@search_term}"
  ResearchEventsListingsPage.open_page(:search_param => search_param)
end

Given(/^I (?:search|have searched) the Arrow site for Research and Events$/) do
  @search_term = 'test'
  search_param = "q=#{@search_term}"
  @srp         = ResearchEventsListingsPage.open_page(:search_param => search_param)
end

And(/^There are Research and Events Search Sort Options$/) do
  expect(ResearchEventsListingsPage.new.get_sort_options_text).to match_array ["Date ascending", "Date descending", "Relevance", "Title ascending", "Title descending", "Type ascending", "Type descending"]
end

Then(/^I find the First Research and Events Search Item$/) do
  ResearchEventsItem.new
end

Then(/^I can see the Title for Research and Events Search Item$/) do
  ResearchEventsItem.new.item_title.verify_visible
end

And(/^I can see the Description for the Research and Events Search Item$/) do
  ResearchEventsItem.new.description.verify_visible
end

And(/^I can see the Date for the Research and Events Search Item$/) do
  ResearchEventsItem.new.item_date.verify_visible
end

Then(/^I can see a Share Button for the Research and Events Search Item$/) do
  ResearchEventsItem.new.item_share_btn.verify_visible
end

And(/^I can see an Add To Project Button for Research and Events Search Item$/) do
  ResearchEventsItem.new.item_add_content_btn.verify_visible
end

Then(/^I am directed to the Research and Events Listings Page$/) do
  $driver.verify_title "Search | #{FigNewton.home_page_title}"
end