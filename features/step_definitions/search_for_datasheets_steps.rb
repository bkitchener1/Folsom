Then(/^I can see a Datasheets Toggle on the Product Listings Page$/) do
  DatasheetsToggle.new.datasheets_toggle.verify_present
end

Then(/^I click on the "(.*)" Toggle$/) do |toggle_type|
  DatasheetsToggle.new.click_to_toggle_datasheets
end

Then(/^I can see the Datasheet Listings$/) do
  SearchFilters.new.verify_datasheets_mode()
  DatasheetsListingsPage.new.datasheet_items.verify_attribute('class', 'SearchResults-datasheetRow')
end

Given(/^I have searched the Arrow site for Datasheet "(.*?)"$/) do |search_s|
  @search_term           = search_s
  search_path_with_param = "products/search?q=#{search_s}&filters=&datasheets=true&allProducts=true"
  @srp                   = DatasheetsListingsPage.open_page(:search_path_with_param => search_path_with_param)
end

And(/^I find the first Datasheet Item with more than 1 Related Part$/) do
  @search_result_datasheet = DatasheetsListingsPage.new.first_datasheet_with_multiple_parts
end

When(/^I click on View Products of the Datasheet Item$/) do
  @search_result_datasheet.view_products_btn.click
end

Then(/^I can see no more than (\d+) Related Parts$/) do |max_size|
  DatasheetsListingsPage.related_parts.verify_count_less_than(max_size + 1)
end

And(/^I can see the matching Parts to the Datasheet$/) do
  DatasheetsListingsPage.new.first_datasheet_with_multiple_parts.get_datasheets_for_related_parts.each { |x|
    DatasheetsListingsPage.related_parts.where(:text,x).verify_visible
  }
end

Then(/^I can see no more than (\d+) Related parts in the Part No\. column$/) do |max_size|
  DatasheetsListingsPage.datasheet_items.each{|item|item.datasheets_for_related_parts.verify_count_less_than(max_size+1)}
end

Then(/^I CANNOT see a View Products link for the Datasheet Search Item$/) do
  @search_result_datasheet.view_products_btn.verify_not_visible
end

And(/^I search for a Datasheet$/) do
  DatasheetsLandingPage.open_page.search_for_datasheet(FigNewton.datasheet_standard_search_string)
end

When(/^I click on the Download Datasheet Button of the Datasheet Search item$/) do
  @search_result_datasheet.datasheet_download.click
end

When(/^I click on the Download Datasheet Button of the first Datasheet search result$/) do
  DatasheetsListingsPage.new.datasheet_items.first.datasheet_download.click
end

# added step to correct scenario

Then(/^I can see the number of Datasheet search count$/) do
  DatasheetsListingsPage.new.verify_search_count_not_zero
end