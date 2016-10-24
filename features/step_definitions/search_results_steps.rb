Then(/^I (?:can|have) quickly closed? a search results column$/) do
  #Using RSpec/expectations. it's clear, it works and it gets this test out of the door.
  expect(ProductListingsPage.close_first_visible_search_column).to be_truthy, "Column not deleted"
end

Then(/^I can see the column deletion reflected in the column chooser$/) do
  expect(CustomiseColumns.new.number_of_deselected_columns).to equal 1
end


Then(/^I should be on page "([^"]*)" of the search results$/) do |num|
  SearchResultsPage.new.verify_current_page(num)
end

When(/^I click the page forward button in search results$/) do
  SearchResultsPage.page_forward.click
end

When(/^I click the page back button in the search results$/) do
  SearchResultsPage.new.page_back.click
end