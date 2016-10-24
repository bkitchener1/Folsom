Given(/^I (?:search|have searched) the Arrow site for Product "(.*?)"$/) do |search_s|
  @search_term = search_s
  @srp         =  ProductListingsPage.new.search_for_product(search_s) #TODO: Refactor away instance var
end

Given(/^I (?:search|have searched) the Arrow site for a Product$/) do
  @search_term = FigNewton.wide_search
  @srp         = ProductListingsPage.new.search_for_product(@search_term) #TODO: Refactor away instance var
end

Given(/^I Search for Product Category '(.*)'$/) do |prod_cat|
  ProductListingsPage.new.search_for_product_category(prod_cat)
end

Given(/^I have searched the Arrow site for ALL Products with "(.*)"$/) do |prod_cat|
  # N.B. Cannot use the ProductItem class as non-Arrow products do not contain same elements. e.g. SKU, clickable title
  @srp = ProductListingsPage.open_page.search_for_all_products(prod_cat)
end

Given(/^I search for a term through a Search Engine$/) do
  search_path_with_param = "custom/dc-to-dc-converter"
  @srp                   = ProductListingsPage.open_poage(:search_path_with_param => search_path_with_param)
end

And(/^I click buy on the first product listing with name "([^"]*)"$/) do |arg|
  ProductItem.buy_btn.click
end

And(/^I click on the Download Datasheet icon of the Search item "([^"]*)"$/) do |arg|
  ProductListingsPage.new.product_item_with_name(arg).datasheet_download.click
end

And(/^I filter by category$/) do
  SearchFilters.category_filters.click
end

Then(/^I can link back to all categories$/) do
  SearchFilters.filter_backlinks.click
  SearchFilters.category_filters.verify_present
end

And(/^I filter by subcategory$/) do
  SearchFilters.new.first_subcategory_filter_link.click
end
Then(/^I can link back to the supercategory$/) do
  SearchFilters.new.filter_backlinks.click
  SearchFilters.new.category_filters.verify_visible
end


Then(/^I can see a Share This Search icon$/) do
  SearchFilters.new.share_this_search_link.verify_visible
end

And(/^The Share Search link is (?:a )?correct$/) do
  share_href = URI.decode(SearchFilters.new.share_this_search_link.attribute('href'))
  expect(share_href).to start_with "mailto:?subject="
  expect(share_href).to include "subject&body"
  expect(share_href).to include $driver.current_url

end

Given(/^I have searched the Arrow site for a Part with a Quote option$/) do
  @api = SearchAjax.new
  item = @api.search_for('58602BA-SUB').get_quote_items.first
  ProductListingsPage.open_page(:search_path_with_param => "products/search?q=#{item["partNumber"]}")
end

Given(/^I have searched the Arrow site for something out of stock$/) do
  @api = SearchAjax.new
  @item = @api.search_for('bav99').get_backordered_items.first
  ProductListingsPage.open_page(:search_path_with_param => "products/search?q=#{@item["partNumber"]}")
end

Given(/^I have searched the Arrow site for an Ecliptek Part$/) do
  @api = SearchAjax.new
  item = @api.search_for('ecliptek').get_ecliptek_items.first
  part_number = item["partNumber"]
  if part_number.include? '-'
      part_number = part_number.split('-')[0]
  end
  ProductListingsPage.open_page(:search_path_with_param => "products/search?q=#{part_number}")
end

Then(/^The Back Order button displays$/) do
  ProductListingsPage.new.back_order_btn.verify_visible
end

Given(/^I have searched the Arrow site for a Verical Part$/) do
  ProductListingsPage.new.search_for_product FigNewton.part_with_verical_sku
end

Given(/^I have searched the Arrow site for a Part with Multiple Price Tiers$/) do
  @search_term = FigNewton.part_with_multiple_cart_option_sku
  ProductListingsPage.new.search_for_product(@search_term)
end

Given(/^I have searched the Arrow site for a Part with a minimum quantity$/) do
  @search_term = FigNewton.part_with_minimum_quantity_sku
  ProductListingsPage.new.search_for_product(@search_term)
end


Then(/^The Search Item has a Quote Button$/) do
  ProductListingsPage.first_quote_btn.verify_visible
end

Then(/^The Search Item has an Ecliptek Buy button$/) do
  ProductListingsPage.first_ecliptek_btn.verify_visible
end

Then(/^The Search Item has a Verical Buy button$/) do
  ProductListingsPage.new.first_verical_btn.verify_visible
end

Then(/^The Search Item has a Contact Us Link$/) do
  ProductListingsPage.new.first_contact_us_link.verify_visible
end

Then(/^The Customise Search Results Columns menu is NOT open$/) do
  CustomiseColumns.new.customise_columns_menu.verify_not_visible
end

And(/^I Click to Customise Columns$/) do
  CustomiseColumns.new.customise_column.click
end

Then(/^The Customise Search Results Columns menu is open$/) do
  CustomiseColumns.new.customise_columns_menu.verify_visible
end

Given(/^I have searched the Arrow site for a Part with Price Tiers$/) do
  @api = SearchAjax.new
  item = @api.search_for('bav99').get_in_stock_items.first
  ProductListingsPage.new.search_for_product(item['partNumber'])
end

Then(/^I can see Price Tiers visible on the Search Result Item$/) do
  ProductListingsPage.new.price_tiers.verify_present
end

And(/^I can see a More Pricing link on the Search Item$/) do
  ProductItem.new.more_prices.verify_visible
end

Then(/^The Search Item does not have any Buying Options$/) do
  ProductListingsPage.new.price_tiers.verify_not_visible
end

And(/^The Search Item displays with a Buy More Button$/) do
  ProductListingsPage.new.product_items.first.buy_btn.verify_text 'BUY MORE'
end

And(/^I can see the Increment amount for the Search Item$/) do
  @first_price_band = ProductItem.new.price_tiers.first
  @qty              = ProductItem.new.get_increment_amount
  @stock_price      = ProductItem.new.get_stock_price(@first_price_band)
  @max              = ProductItem.new.get_max_amount
end

And(/^I Enter the Quantity for the Search Item$/) do
  step %Q"I Enter a Quantity of \"#@qty\" for the Search Item"
end

When(/^I Enter a Quantity of "([^"]*)" for the Search Item$/) do |qty|
  ProductItem.new.qty.set_text qty
end

Then(/^The relevant Price Tier is highlighted$/) do
  if ProductItem.new.highlighted_price_tier.text.include? ","
    value = @qty.to_s.gsub("000", ",000")
  else
    value = @qty.to_s
  end
  ProductItem.new.highlighted_price_tier.verify_text value
end

When(/^I enter a Qty "([^"]*)" greater than the increment for the Search Item$/) do |additional|
  @qty = @qty + additional
  step %Q"I Enter a Quantity of \"#@qty\" for the Search Item"
end

Then(/^The Total Price does NOT display$/) do
  ProductItem.new.verify_total_price_not_visible
end

Then(/^The Total Price displays for the Search Item$/) do
  ProductItem.new.verify_total_price_visible
end

And(/^The Search Item has the Total Price with the relevant Price$/) do
  @total = (@qty*@stock_price).round(2)
  ProductItem.new.total_price.verify_text(@total)
end

When(/^I click on Load More$/) do
  Paging.new.load_more.click
end

Then(/^I can see the Stock Level for the Search Item$/) do
  expect(ProductItem.new.get_stock_column_text).not_to be_empty
  expect(ProductItem.new.get_available_stock).to eq ProductItem.new.get_max_amount
end

And(/^The Stock Level for the Search item is more than zero$/) do
  expect(ProductItem.new.get_available_stock).to be > 0
end

Then(/^I CANNOT see the Stock Level for the Search Item$/) do
  expect(ProductItem.new.get_stock_column_text).to eq ''
end

Given(/^I have searched the Arrow site for a single Discontinued Part$/) do
  @api = SearchAjax.new
  @item = @api.search_for('discontinued').get_discontinued_items.first
  ProductListingsPage.new.search_for_product @item["partNumber"]
end

Then(/^I can see that the Search Item is Discontinued$/) do
  ProductListingsPage.new.discontinued_notifier.verify_visible
end


And(/^I search for a product line with a non\-numeric filter$/) do
  ProductListingsPage.new.search_for_product FigNewton.product_category_with_non_numeric_filter
end

And(/^I search for a wide range of products$/) do
  ProductListingsPage.new.search_for_product FigNewton.wide_search
end

When(/^I click on the Download Datasheet icon of the Search item$/) do
  ProductItem.new.datasheet_download.click
end

When(/^I click on the "([^"]*)" Search Filter Link$/) do |filter_no|
  SearchFilters.new.filter_by_link_no(filter_no)
end

Then(/^I am directed to the Products Search Results Page$/) do
  $driver.verify_title "Search | Arrow.com"
  $driver.verify_url "search"
end

When(/^I click on the Title of the Search Item$/) do
  @search_result_part = ProductItem.new
  @part_sku = @search_result_part.part_sku.text
  @part_manu = @search_result_part.part_manu.text
  ProductItem.new.open_part_page
end

Given(/^I have purchased the increment amount for a Search item with more than three Price Tiers$/) do

  step %Q"I have searched the Arrow site for a Part with Price Tiers"
  step %Q"I can see the Increment amount for the Search Item"
  step %Q"I Enter the Quantity for the Search Item"
  step %Q"The Total Price displays for the Search Item"
  step %Q"The Search Item has the Total Price with the relevant Price"
  step %Q"I click to Buy for the Search Item"
end

Then(/^"(\d+)" result items are displayed$/) do |total_displayed|
  SearchResultsPage.new.results_rows.verify_count(total_displayed)
end

When(/^I scroll to the bottom of the Page$/) do
  Footer.footer.scroll_into_view
end

Then(/^I will see the Load More Button$/) do
  Paging.load_more.verify_visible
end

And(/^I can see the Back to Top link$/) do
  Paging.back_to_top.verify_visible
end

Then(/^There are less than (\d+) results$/) do |max_size|
  SearchResultsPage.new.results_rows.verify_count_less_than(max_size)
end

And(/^I will NOT see the Load More Button$/) do

  Paging.load_more.verify_not_visible
end

Then(/^The Search Item does NOT have any Price Tiers visible$/) do
  ProductListingsPage.new.price_tiers.verify_not_visible
end

Then(/^The Search Results columns are not NOT scrollable$/) do
  ProductListingsPage.new.search_scroll_div.verify_not_visible
end

Then(/^I can see a Sort Select drop\-down$/) do
  SearchResultsPage.new.sort_drop_down.verify_visible
end

And(/^There are Product Search Sort Options$/) do
  text = SearchResultsPage.new.get_sort_options_text
  expect(text).to match_array ["Manufacturer Ascending", "Manufacturer Descending",
                                                              "Part Number Ascending", "Part Number Descending",
                                                              "Price Ascending", "Price Descending",
                                                              "Product Type Ascending", "Product Type Descending",
                                                              "Relevance", "Stock Ascending", "Stock Descending"]
end

And(/^There are Datasheet Search Sort Options$/) do
  text = SearchResultsPage.new.get_sort_options_text
  expect(text.length).to be > 0
end

Given(/^I select the Sort Option "([^"]*)"$/) do |sort_value|
  SearchResultsPage.new.sort_drop_down.select_by(:value, sort_value)
end

Then(/^The selected Sort Option value is "([^"]*)"$/) do |sort_option|
  SearchResultsPage.new.sort_drop_down.verify_option_selected sort_option
end

Given(/^I Submit a search on the Desktop version of the Arrow site for "(.*?)"$/) do |search_s|
  Header.header_search_input_info.click
  @search_term                     = search_s
  Header.header_search_input.send_keys @search_term, :enter
end

Given(/^I Submit a search on the Mobile version of the Arrow site for "(.*?)"$/) do |search_s|
  step "I click on the Mobile search icon"
  @search_term = search_s
  Header.header_search_input.verify_visible
  Header.header_search_input.send_keys @search_term, :enter
end

When(/^I click on the Mobile search icon$/) do
  Header.mobile_search_icon.click
end

Then(/^My search term displays in the Search field$/) do
  Header.header_search_input.verify_value(@search_term)
  $driver.verify_url "q=#{@search_term}"
end

Then(/^I can see the helpful text telling me that no results were found$/) do
  ZeroResults.new.no_results_header.verify_visible
  ZeroResults.new.no_results_header.verify_text "Sorry, your search returned no results."
  ZeroResults.new.no_results_sub_header.verify_visible
  ZeroResults.new.no_results_sub_header.verify_text "Do you need help finding something?"
end

And(/^I have at least "(\d+)" buttons to help me$/) do |size|
  ZeroResults.zrp_buttons.verify_count_greater_than(size)

end

And(/^I Buy the Minimum amount of the Search Item$/) do
  ProductListingsPage.product_items.buy_minimum
  sleep 2
end


And(/^I click to Buy for the Search Item$/) do
  ProductItem.new.buy_btn.click
end

Then(/^I can see the Minimum Quantity in the Search Item's Quantity field$/) do
  ProductItem.new.qty.verify_attribute("placeholder",@qty)
end

Then(/^I can see the Default Search Results Columns$/) do
  ProductListingsPage.new.verify_default_columns
end

Then(/^All columns are selected on the Search Results Page$/) do
  CustomiseColumns.custom_column_by_manu.verify_selected
  CustomiseColumns.custom_column_by_type.verify_selected
  CustomiseColumns.custom_column_by_description.verify_selected
  CustomiseColumns.custom_column_by_stock.verify_selected
end

And(/^I de\-select the Search Column "([^"]*)"$/) do |arg|
  CustomiseColumns.new.deselect_column(arg)
end

And(/^I Click the Apply button to Customise my Search Columns$/) do
  CustomiseColumns.apply_custom_column_btn.click
end

Then(/^I CANNOT see the Search Results Column "([^"]*)"$/) do |arg|
  ProductListingsPage.new.verify_column_not_present(arg)
end

And(/^I select the Search Column "([^"]*)"$/) do |arg|
  CustomiseColumns.new.select_column(arg)
end

Then(/^I see an error message that at least one option has to be selected$/) do
  CustomiseColumns.error_message.verify_text "Please select at least 1 column"
end

When(/^I Click the Cancel button in the Customise my Search Columns Panel$/) do
  CustomiseColumns.cancel_custom_column_btn.click
end

And(/^I can see some Extra Search Results Columns$/) do
  pending
end

When(/^I click on the Manufacturer Name of the Search Item$/) do
  ProductItem.new.part_manu.click
end

And(/^I visit page "([^"]*)" of the Arrow site Search results for "([^"]*)"$/) do |page_no, search_s|
  ProductListingsPage.new.go_to_search_results_page(search_s, page_no)
end

# update for the removal of load more button and per_page selection

When(/^I select "([^"]*)" in the drop down$/) do |arg|
  SearchResultsPage.new.per_page.verify_visible
  SearchResultsPage.new.per_page.select_by(:text,'50')
end

# update for the removal of load more button

And(/^I will NOT see the paging$/) do
  SearchResultsPage.per_page.verify_not_visible
end

And(/^The button should show VIEW on Tablet and Desktop$/) do
    ProductItem.new.view_btn.verify_visible
end

When(/^When I click the VIEW button$/) do
  ProductItem.new.view_btn.first.click
end

And(/^The VIEW button should NOT show on mobile$/) do
  ProductItem.new.view_btn.verify_not_visible
end

Then(/^The "([^"]*)" column should be displayed in it's default sorting$/) do |col|
  ProductListingsPage.new.verify_each_column_default(col)
end

When(/^I click the "([^"]*)" column on the search results$/) do |col|
  ProductListingsPage.new.click_column(col)
end

Then(/^The "([^"]*)" column should be displayed as Ascending$/) do |col|
  ProductListingsPage.new.verify_ascending_column(col)
end

Then(/^The "([^"]*)" column should be displayed as Descending$/) do |col|
  ProductListingsPage.new.verify_descending_column(col)
end