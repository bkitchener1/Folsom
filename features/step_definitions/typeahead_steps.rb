Given(/^I set focus to the Search input$/) do
  Header.header_search_input.send_keys " "
end

And(/^I wait for the Type Ahead Panel to Display$/) do
  TypeAhead.typeahead_parent.verify_visible
end

Then(/^There is at least 1 Product category displaying$/) do
  # @product_cats = @current_page.typeahead_cat_items_element
  TypeAhead.categories.verify_count_greater_than 0
end

When(/^I enter a search query of "(.*?)"$/) do |query|
  #TODO: remove instance variable
  @search_term                     = query
  Header.header_search_input.set_text @search_term
end

Then(/^The Matching Results panel is visible$/) do
  TypeAhead.typeahead_related_search.verify_visible
end

Then(/^I can see up to "([^"]*)" Matching Results in the Typeahead Search Panel$/) do |max_size|
  TypeAhead.auto_complete_results.verify_count_less_than(max_size.to_i + 1)
end

When(/^I start to search for a product$/) do
  Header.header_search_input.send_keys FigNewton.search_result_with_filtering_options
end

Then(/^I can select each search category from the typeahead results$/) do
  TypeAhead.typeahead_results.verify_visible
  links = URI.escape((TypeAhead.new.get_results_in_cats_hrefs).join(''))
  expect(links).to match Regexp.new($base_url)
  expect(links).to include 'products'
  expect(links).to include 'datasheets'
  expect(links).to include 'reference-designs'
  expect(links).to include 'research-and-events/'
  expect(links).to include 'search'
  expect(links).to include FigNewton.search_result_with_filtering_options
end

Then(/^The Product Category panel is visible$/) do
  TypeAhead.new.typeahead_categories.verify_visible
end

When(/^I click the Close TypeAhead button$/) do
  TypeAhead.new.close_typeahead_btn.click
end

Then(/^The Type Ahead panel is NOT visible$/) do
  TypeAhead.new.typeahead_parent.verify_not_visible
end

And(/^The Product Category panel is NOT visible$/) do
  TypeAhead.new.typeahead_categories.verify_not_visible
end

Then(/^I can see the Total amount of Parts available on the site\.$/) do
  TypeAhead.new.total_parts.verify_visible
end

Then(/^The Product Category item has a corresponding link, header text, image and an amount of parts$/) do
  TypeAhead.new.categories.each{|category|
  category.product_link.verify_attribute('href', ProductsLandingPage.page_url)
  category.header_text.verify_visible
  category.product_icon.verify_visible
  category.parts_text.verify_text " Products"
  }
end

Then(/^Each Result in the Typeahead Search Panel has the Search Term in Bold$/) do
  TypeAhead.new.auto_complete_results.each{|result|result.verify_text @search_term.upcase}
end

Then(/^Each Result in the Typeahead Search Panel is a valid Parametric Search link$/) do
  TypeAhead.new.auto_complete_results.each{|result|WebElement.new("a",result).verify_attribute("href","#{$base_url}/products/search?q=") }
  TypeAhead.new.auto_complete_results.each{|result|result.verify_attribute("data-result-id",@search_term)}
end