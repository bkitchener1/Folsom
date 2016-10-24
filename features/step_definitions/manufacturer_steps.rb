
Then(/^The Manufacturer link is correct$/) do
  PartDetailsPage.new.manufacturer.verify_attribute("href", "#{$base_url}/products/manufacturers/")
end

Then(/^I am directed to the Manufacturer Detail Page$/) do
  $driver.verify_url "manufacturer"
end

And(/^I can see more than "([^"]*)" Section Amongst the Manufacturer Results$/) do |min|
  ManufacturersTabs.new.results_heading.verify_count_greater_than (min-1)
end

Then(/^I can see the Browse Manufacturer A\-Z section$/) do
  ManufacturersTabs.new.browse_manu_section.verify_visible
end

And(/^The selected Tab is visible$/) do
  ManufacturersLandingPage.new.active_tab.verify_visible
end

Given(/^I visit the Manufacturers Detail Page$/) do
  ManufacturersDetailPage.open_page({:manu_detail_pg_url => "#{FigNewton.manu_detail_url}"})
end


Given(/^I visit the Manufacturers Landing Page$/) do
  ManufacturersLandingPage.open_page
end

Then(/^The Selected Tab is "([^"]*)"$/) do |tab_name|
  ManufacturersTabs.selected_tab.verify_attribute('data-target', tab_name.sub(" - ", ""))
end

And(/^The URL tab parameter should be "([^"]*)"$/) do |tab_name|
  $driver.verify_url "?tab=#{URI::encode(tab_name.gsub(" - ", ""))}"
end

And(/^The default view type is "([^"]*)"$/) do |data_view_type|
  ManufacturersLandingPage.new.active_view_type.verify_attribute('data-viewtype', data_view_type)
end

Then(/^The Results heading is "([^"]*)"$/) do |tab_name|
  # TODO re-factor as this will fail with translations.
  ManufacturersTabs.results_heading.verify_text tab_name
end

Then(/^The Linecards section is visible$/) do
  ManufacturersLandingPage.new.linecards_div.verify_visible
end

And(/^I can see Linecard items$/) do
  ManufacturersLandingPage.new.linecards.verify_visible
end


Then(/^I can see heading on the manufacturers landing page$/) do
  ManufacturersLandingPage.manu_header.verify_visible
end

Then(/^I see the Manufacturer page title$/) do
  ManufacturersLandingPage.manu_header.verify_visible.verify_text 'Manufacturers'
end

And(/^I see the first paragraph under the page title$/) do
  ManufacturersLandingPage.info_large.verify_visible
end

And(/^I see the page description under the first paragraph in a smaller font than the first paragraph$/) do
  ManufacturersLandingPage.info_small.verify_visible
end

Then(/^I can see Manufacturer heading on the manufacturer landing page$/) do
  ManufacturersLandingPage.new.manu_header.verify_visible
end

Given(/^I visit the Manufacturers Detail Page with '(.*)'$/) do |page_type|
  case page_type
    when 'more than 3 news content'
      manu_detail_pg_param = FigNewton.manu_detail_url_with_more_than_3_news_content
    when 'less than 3 news content'
      manu_detail_pg_param = FigNewton.manu_detail_url_with_less_than_3_news_content
    when 'Reference Design'
      manu_detail_pg_param = FigNewton.manu_detail_url_with_ref_design
  end
  ManufacturersDetailPage.open_page({:manu_detail_pg_url => "#{manu_detail_pg_param}"})
end

Then(/^I CANNOT see Load more link$/) do
  ManufacturersDetailPage.new.load_more_btn.verify_not_visible
end