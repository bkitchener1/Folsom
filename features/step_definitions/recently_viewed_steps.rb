Given(/^I find the Recently Viewed 'Reference Designs' Module$/) do
  @recently_viewed = RecentlyViewed.reference_design
  @recently_viewed.verify_visible
end


Given(/^I find the Recently Viewed 'Datasheets' Module$/) do
  @recently_viewed = RecentlyViewed.datasheets
  @recently_viewed.verify_visible
end

And(/^I can see Embedded Search in Recently Viewed section$/) do
  @recently_viewed.embedded_search.verify_visible
end

And(/^I can see the correct title for Featured Datasheets$/) do
  @recently_viewed.recently_viewed_items_heading.verify_text FigNewton.featured_datasheet_title_new_users
end

And(/^I can see lists of Recently Viewed Items$/) do
  @recently_viewed.recently_viewed_items.verify_count_greater_than 0
end


And(/^I CANNOT see the title for Featured Datasheets$/) do
  @recently_viewed.recently_viewed_items_heading.verify_text_not FigNewton.featured_datasheet_title
end

And(/^I can see the correct title for Recently viewed Lists$/) do
# TODO re-factor as this will fail with translations.
  @recently_viewed.recently_viewed_items_heading.verify_text FigNewton.recently_viewed_title
end

And(/^I can see the correct title for Recently viewed Lists for new users$/) do
# TODO re-factor as this will fail with translations.
  @recently_viewed.recently_viewed_items_heading.verify_text FigNewton.featured_datasheet_title_new_users
end


And(/^I can see '(.*)' items under Recently Viewed section$/) do |num_of_items|
  @recently_viewed.recently_viewed_items.verify_count num_of_items
end

And(/^I CANNOT see the title for Recently Viewed Lists$/) do
  @recently_viewed.recently_viewed_items_heading.verify_text_not FigNewton.recently_viewed_title
end

When(/^I search for Recently Viewed Datasheets "([^"]*)" from Home Page$/) do |arg|
  HomePage.new.recently_viewed_datasheets.submit_embedded_search(arg)
end

When(/^I search for Recently Viewed Reference Designs "([^"]*)" from Home Page$/) do |arg|
  HomePage.new.recently_viewed_reference_designs.submit_embedded_search(arg)
end