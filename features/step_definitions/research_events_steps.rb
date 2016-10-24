Given(/^I visit the Research and Events Landing Page$/) do
  ResearchEventsPage.open_page
end

Then(/^I can see at least "([^"]*)" section headers in black$/) do |min|
  ResearchEventsPage.black_section_headers.verify_count_greater_than(min.to_i-1)
end


When(/^I find the first News Article on the Research and Events Page$/) do
  @masonry_item = ResearchEventsPage.new.articles.info_tiles.first
end

Then(/^I can see the Hot Topic heading$/) do
  ListBlock.hot_topic_heading.verify_visible
end

And(/^I am viewing the "([^"]*)" section$/) do |section_link_text|
  TabbedContent.new.tabbed_content_link(section_link_text).click
end


And(/^I click the first tag in an event$/) do
  tag = ResearchEventsPage.new.events.info_tiles.select{ |x| x.tags.exists?}.first.tags.first
  tag.click
end

And(/^I click the first tag in an article$/) do
  tag = ResearchEventsPage.new.articles.info_tiles.select{ |x| x.tags.exists?}.first.tags.first
  tag.click
end

Then(/^all tags should have correct urls$/) do
  ContentTags.new.tags.each{|tag|
    text = tag.text
    tag.verify_attribute("href","/en/tags/#{text.downcase.gsub(" ","-").gsub(",","")}")}
end


Then(/^the Research and Events page should have tags visibles$/) do
  ContentTags.new.tags.verify_present
end

