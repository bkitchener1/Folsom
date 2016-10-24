Given(/^I visit the Products Landing Page$/) do
  ProductsLandingPage.open_page
end


Then(/^I see Tabbed Content Filter module$/) do
  TabbedContent.tabbed_content.verify_visible
end

And(/^The First link is visible and is selected$/) do
  TabbedContent.tabbed_content_links.verify_visible.verify_attribute("class","is-active")
end

Then(/^I can see '(.*)' tab as active tab$/) do |product_tab|
  case product_tab
    when 'NEW PRODUCTS'
      ProductsLandingPage.new_products_tab.verify_attribute("class","is-active")
  end
end

And(/^I can see 1x1 Product Content Grid$/) do
  Masonry.one_by_one.verify_visible
end

And(/^I can see 2X1 Product Content Grid$/) do
  Masonry.two_by_one.verify_visible
end

And(/^I can see 2X2 product content Grid$/) do
  Masonry.two_by_two.verify_visible
end

Then(/^I can see Manufacturer heading on the products page$/) do
  ProductsLandingPage.manufacturer_heading.verify_visible
end


And(/^I click the All Products Tab$/) do
  ProductsLandingPage.new.all_products_tab.click
end