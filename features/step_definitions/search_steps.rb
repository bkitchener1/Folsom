Given(/^I view search results for Product Category "([^"]*)"$/) do |arg|
  ProductListingsPage.new.search_for_product_category arg
end

Given(/^I view search results for a Part with Multiple Price Tiers$/) do
  ProductListingsPage.new.search_for_product FigNewton.part_with_multiple_cart_option_sku
end

Given(/^I view search results for Reference Designs$/) do
  ReferenceDesignListingsPage.open_page(:search_param => "q='test'")
end

Given(/^I view search results for the Arrow site for Research and Events$/) do
  ResearchEventsListingsPage.open_page(:search_param => "q='test'")
end

  When(/^I search for a specified product$/) do
  ProductListingsPage.new.search_for_product FigNewton.part_with_lead_time_sku
end

Then(/^the product is displayed$/) do
  ProductListingsPage.new.product_is_displayed?(FigNewton.part_with_lead_time_sku)
end

When(/^I click on the Search Column "([^"]*)"$/) do |column_data_sort_by|
  SearchResultsPage.new.click_on_search_column column_data_sort_by
  SearchResultsPage.new.wait_for_search_overlay_to_finish
end

Then(/^The URL Sort Type parameter should change to include "([^"]*)"$/) do |sort_value|
  $driver.verify_url "sortType=#{sort_value}"
end

Then(/^The URL Sort By parameter should change to include "([^"]*)"$/) do |sort_value|
  $driver.verify_url "sortBy=#{sort_value}"
end

When(/^I scroll down to the end of the Search Results$/) do
  SearchResultsPage.new.results.last.scroll_into_view
end

And(/^The Sticky Results Columns are visible$/) do
  SearchResultsPage.new.sticky_column_header.verify_visible
end

Then(/^I can see that the results are displayed with alternating contrast$/) do
  SearchResultsPage.new.odd_numbered_search_result_row.verify_style 'background-color', '255, 255, 255'
  SearchResultsPage.new.even_numbered_search_result_row.verify_style 'background-color', '238, 238, 238'
end

Then(/^I can see that the last column has shaded search results$/) do
  pending
end

Then(/^I can change the Sort Option$/) do |table|
  table.hashes.each do |hash|
    sort_option = hash['sort_option']
    print "checking sort option: #{sort_option}"
    SearchResultsPage.new.wait_for_search_overlay_to_finish

    SearchResultsPage.new.sort_drop_down.verify_visible.select_by(:value,sort_option)
    $driver.verify_url "sortType=#{sort_option}"
  end

end

# updated code for verify search count

Then(/^I can see the number of Search Results displayed$/) do
  SearchResultsPage.new.search_results_count.verify_visible
  SearchResultsPage.new.verify_search_count_not_zero
end


Given(/^I note the Total Amount of Search Results$/) do
  @search_category = SearchFilters.new.category_filters[1].text
  @search_filter = SearchFilters.new.filter_links[1].text
end

Then(/^I can see the number of Search Results is updated to reflect my Filter selection$/) do
  SearchFilters.new.filter_links[0].verify_text @search_filter

end

Then(/^I CANNOT see the number of Search Results displayed$/) do
  SearchResultsPage.new.search_results_count.verify_not_visible
end


And(/^I click on the Datasheet toggle in the search results$/) do
  SearchResultsPage.datasheet_toggle.click
end

# add to capture search errors

Then(/^there is no error on the search results page$/) do
  ArrowBase.new.verify_search_page_no_errors
end