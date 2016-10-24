

Then(/^I can see a Cancel Button in the Search Filters$/) do
  SearchFilters.new.cancel_filter_btn.verify_visible
end

And(/^I can see an Apply Button in the Search Filters$/) do
  SearchFilters.new.apply_filter_btn.verify_visible
end

Then(/^I CANNOT see a Cancel Button in the Search Filters$/) do
  SearchFilters.new.cancel_filter_btn.verify_not_visible
end

And(/^I CANNOT see an Apply Button in the Search Filters$/) do
  SearchFilters.new.apply_filter_btn.verify_not_visible
end

Then(/^I find the Filter Container with data name "([^"]*)"$/) do |data_filtergroup_value|
  @filter_container = SearchFilters.new.get_filter_container_by_data_value(data_filtergroup_value)
end

When(/^I apply the search filters$/) do
  SearchFilters.category_filters.verify_present.click
  SearchFilters.new.apply_filter_btn.click
end

When(/^I can apply the search filters$/) do
  SearchFilters.new.apply_filter_btn.verify_present
end

When(/^I CANNOT apply the search filters$/) do
  SearchFilters.new.apply_filter_btn.verify_attribute_not('class', 'is-active')
end

Then(/^I can cancel the filtering$/) do
  SearchFilters.new.cancel_filter.click
  SearchFilters.new.apply_filter_btn.verify_visible
end

Then(/^I can see filtering options$/) do
  SearchFilters.filter_links.verify_visible
end

Then(/^I can filter by category$/) do
  SearchFilters.new.category_filters.click
  SearchFilters.new.subcategory_filters_list.verify_visible
end

Then(/^I (?:can )?filter-search the categories of product search results$/) do
  SearchFilters.filter_search_field.send_keys FigNewton.filter_search_term
  SearchFilters.visible_category.verify_text FigNewton.filter_search_term
end

And(/^I select a filtered category$/) do
  SearchResultsPage.new.click_search_result(FigNewton.filter_search_term)
end



Then(/^the search box is cleared$/) do
  SearchFilters.new.filter_search_field.verify_text("", 30, true)
end

When(/^I search for a part with filtering options$/) do
  ProductListingsPage.new.search_for_product FigNewton.search_result_with_filtering_options
end

Then(/^I can filter a range of values$/) do
  SearchFilters.new.individual_filter_panel.verify_count_greater_than(4)
end

Then(/^I can set the filter to (\d+)$/) do |value|
  expect(SearchFilters.new.set_minimum_scroll_filter_to value).to match Regexp.new(value.to_s)
  true
end

Then(/^I am informed that more search options are available$/) do
  SearchFilters.new.more_options_information_panel.verify_visible
end

Then(/^I can no longer see the 'more search options' information$/) do
  SearchFilters.more_options_information_panel.verify_not_visible
end

Then(/^I can filter appropriately for a non-numerical value$/) do
  SearchFilters.new.category_filters.first.verify_attribute("data-filter-type-rendered","Checkbox")
end



Then(/^I can filter for a non\-numerical value using the original method$/) do
  SearchFilters.new.category_filters.first.verify_attribute("data-filter-type-rendered","Slider")
end

Then(/^I can see a "([^"]*)" Filter Group$/) do |filter_group_name|
  containers = SearchFilters.new.filter_containers.select{ |filter|filter.attribute('data-filtergroup') == filter_group_name }
  containers.first.verify_present
  @filter_container = containers.first

end


Then(/^I cannot see a "([^"]*)" Filter Group$/) do |filter_group_name|
  expect(SearchFilters.new.get_filter_container_by_data_value(filter_group_name).nil?).to be true
end


Then(/^I can see a Checkbox Search Filter with value "([^"]*)"$/) do |checkbox_value|
  @checkbox_filter = SearchFilters.new.get_checkbox_filter(checkbox_value)
  @checkbox_filter.checkbox_filter.verify_present
end

Then(/^The Filter Group has Radio Checkboxes$/) do
  @filter_container.verify_radio_filters_present
end

Then(/^I can see "([^"]*)" Filter Sections on the Search Results Page$/) do |size|
  SearchFilters.new.filter_containers.verify_count(size)
end


Given(/^I can see the Default Filter Groups$/) do
  @filter_groups = SearchFilters.new.get_all_filter_containers_text
end


Then(/^I can see the Filter Groups have changed$/) do

  expect(SearchFilters.new.get_all_filter_containers_text).not_to eq @filter_groups
end

Then(/^The Search Filters visibility is "([^"]*)"$/) do |visibility|
  if visibility == "true"
  SearchFilters.new.search_filter_bar.verify_visible
  else
    SearchFilters.new.search_filter_bar.verify_not_visible
  end

end

Then(/^The mobile Search Filters are visible$/) do
  SearchFilters.new.search_filter_bar.verify_visible

end

When(/^I click on the Search Filters Button$/) do
  SearchFilters.new.open_search_filters_on_mob
  SearchFilters.new.search_filter_bar.verify_visible
end

When(/^I click on the X to close the Search Filters$/) do
  SearchFilters.new.close_search_filters_on_mob
end

When(/^I click on the Cancel Button in the Search Filters$/) do
  SearchFilters.new.cancel_search_filters_on_mob
end

When(/^I CANNOT see the X to close the Search Filters$/) do
  SearchFilters.new.close_filters_btn.verify_not_visible
end

Then(/^I can see Radio Filter options$/) do
  SearchFilters.new.radio_filter_containers.verify_visible
end

When(/^I select the Radio Filter for Manufacturer '(.*)'$/) do |radio_filter_data_name|
  WebElement.new(:xpath=>"//label[contains(text(),'#{radio_filter_data_name}']")
  SearchFilters.new.apply_search_filter
end

Then(/^I can see the Search Result filter by this Manufacturer$/) do
  SearchResultsPage.new.parse_result_item_for_search_keyword(@search_filter_option)
end

When(/^I select the checkbox Filter for Manufacturer '(.*)'$/) do |checkbox_value|
  @manu_filter_container = SearchFilters.new.get_filter_container_by_data_value('Manufacturer_name')
  if (@manu_filter_container.does_filter_have_see_more_link)
    @manu_filter_container.see_more.click
  end
  @search_filter_option = checkbox_value
  @checkbox_filter = @manu_filter_container.filter_checkboxes.where(:text,checkbox_value).first
  @checkbox_filter.click_label
  SearchFilters.new.apply_search_filter
end


Then(/^I can filter for values in a checkbox format$/) do
  SearchFilters.filter_eurohs.verify_present
end

And(/^I am filtering using the horizontal filters$/) do
  SearchFilters.new.switch_to_horizontal_filters
end

When(/^I choose to automatically apply the filters$/) do
  SearchFilters.new.automatically_apply_filters.click
end

Then(/^I do not need to take action to apply the horizontal layout filters$/) do
  SearchFilters.new.verify_automatic_search_filters
end

Given(/^I am on the manufacturer fairchild\-semiconductor page$/) do
  $driver.get "#{$base_url}/products/manufacturers/f/fairchild-semiconductor"
end


And(/^I click on the "([^"]*)" product category$/) do |arg|
  SearchFilters.new.click_category(arg)
end

When(/I click on the "([^"]*)" sub\-category heading$/) do |arg|
  SearchFilters.new.click_sub_category_heading(arg)
end

Then(/^I should be on the correct URL filtered with "([^"]*)" as the Manufacturer and "([^"]*)" as the sub\-category$/) do |arg1, arg2|
  $driver.verify_url "#{$base_url}/products/search?subcat=#{arg2}&filters=Manufacturer_name:#{arg1};"
end

And(/^The category filter should show "([^"]*)" and the Manufacturer filter "([^"]*)"$/) do |arg1, arg2|
  SearchFilters.new.verify_category_manufacturer_filter(arg1, arg2)
end

Then(/^I can see a scrollbar in a search filter$/) do
  SearchFilters.new.filter_panel_scrollbar.verify_present
end


And(/^my choice is remembered on returning to the page$/) do
  HomePage.open_page
  ProductListingsPage.new.search_for_product FigNewton.wide_search
  SearchFilters.new.apply_filter_btn.verify_present
end

Then(/^I can clear all the filters$/) do
  SearchFilters.new.clear_all_filters_link.click
end

And(/^I filter the results$/) do
  SearchFilters.new.manufacturer_filter.click
end


And(/^I use the apply button$/) do
  SearchFilters.new.apply_filter_btn.click
end

When(/^I can clear all filters$/) do
  ProductListingsPage.new.search_for_product FigNewton.wide_search
  SearchFilters.new.manufacturer_filter.click
end

And(/^The Search Filter with value "([^"]*)" is Checked$/) do |checkbox_value|
  @checkbox_filter = SearchFilters.new.get_checkbox_filter(checkbox_value)
  @checkbox_filter.is_checkbox_checked
end

And(/^The URL filter parameter should change to include "([^"]*)"$/) do |arg|
  $driver.verify_url "&filters=#{arg}"
end

Then(/^I can see the results after the wait spinner has closed$/) do
  $driver.verify_html_not('is-search-loading')
end

And(/^I filter product search results$/) do
  ReferenceDesignLandingPage.first_result_item.click
  ReferenceDesignLandingPage.first_draw_item.click
end