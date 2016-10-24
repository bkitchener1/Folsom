Given(/^I visit the "([^"]*)"$/) do |arg|
  Object.const_get(arg).open_page
end

When(/^I visit the ProductCategorySitemapPage$/) do
  ContentPage.open_page(:content_pg_url=>'product-category-sitemap')
end

When(/^I visit the Divisional Landing Page$/) do
  ContentPage.open_page(:content_pg_url=>"#{FigNewton.div_landing_page}")
end

And(/^I scroll back to the top of the page$/) do
  $driver.scroll_top
end

Given(/^I visit the ManufacturersDetailPage$/) do
  ManufacturersDetailPage.open_page(:manu_detail_pg_url => FigNewton.manu_detail_url)
end

Given(/^I visit the DatasheetsDetailPage$/) do
  DatasheetsDetailPage.open_page(:datasheet_id =>  FigNewton.datasheets_id)
end

Given(/^I visit the url "([^"]*)"$/) do |url|
  $driver.get ("#{$base_url}/#{url}")
end

Then(/^I am re\-directed to "([^"]*)"$/) do |exp_url|
  $driver.verify_url "#{$base_url}#{exp_url.downcase}"
end

Given(/^I request link$/) do |table|
  table.hashes.each do |hash|
    url = "#{$base_url}#{hash['orignal_link']}"
    @browser.goto url
    p "#{url}  ==> #{@browser.url}"
  end

end

Given(/^I visit "([^"]*)"$/) do |arg|
  Object.const_get(arg).open_page
end

Given(/^I visit the Product Category Sitemap Page$/) do
  ContentPage.open_page(:content_pg_url => 'product-category-sitemap')
end

Given(/^I visit the Events Landing Page$/) do
  EventsLandingPage.open_page
end


Given(/^I visit the "([^"]*)" Landing Page$/) do |landing_page|
  case landing_page
    when 'Event'
      step "I visit the Events Landing Page"

    when 'Articles'
      step "I visit the Articles Landing Page"

    when 'Research and Events'
      step "I visit the Research and Events Landing Page"

    when 'Reference Design'
      step "I visit the Reference Design Landing Page"

    when 'Products'
      step "I visit the Products Landing Page"

    when 'Videos'
      step "I visit the Videos Landing Page"
  end
end


When(/^I scroll down to the bottom of the page$/) do
  # @current_page.footer_element.scroll_into_view
  $driver.scroll_bottom
end

Then(/^I will be directed to the relevant page "([^"]*)"$/) do |arg|
  $driver.verify_title arg
end

When(/^I press the "([^"]*)" key$/) do |key|
  case key
    when 'Up'
      WebElement.new("body").send_keys :arrow_up
    when 'Down'
      WebElement.new("body").send_keys :arrow_down
    when 'Right'
      WebElement.new("body").send_keys :arrow_right
  end
end