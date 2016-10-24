
Then(/^I can see Page Filters$/) do
  TagsFilter.page_filters.verify_visible
end

And(/^Only the First Page Filter selected by default$/) do
  TagsFilter.page_filters.first.verify_attribute('class','is-active')
end

When(/^I select the last Page Filter$/) do
  TagsFilter.page_filters.last.click
end

Then(/^The last Page Filter is the only Filter selected$/) do
  TagsFilter.page_filters.last.verify_attribute('class','is-active')
end

Then(/^I can see Content Filter Tags on the Research and Events page$/) do
  TagsFilter.filter_tags.verify_visible
end

Then(/^The First Tag is a Clear$/) do
  TagsFilter.filter_tags.first.verify_text("CLEAR")
end


When(/^I press the Clear Tag$/) do
  TagsFilter.clear_filter_tags.click

end

Then(/^No Filter Tags are Active$/) do
  TagsFilter.active_filter_tags.verify_not_visible
end

Then(/^Each label in filter container "([^"]*)" contains "([^"]*)"$/) do |arg1, arg2|
  @filter_container = SearchFilters.filter_containers.where(:text, arg1)
  @filter_container.labels.each{|container|
  container.verify_text(arg2)}

end