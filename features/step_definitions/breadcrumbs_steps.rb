Then(/^I should NOT see a Breadcrumb$/) do
  Breadcrumb.breadcrumb_div.verify_not_visible
end

Then(/^The Back link in the Breadcrumb is not present$/) do
  Breadcrumb.breadcrumb_back.verify_not_visible
end

Then(/^The Back link in the Breadcrumb is present$/) do
  Breadcrumb.breadcrumb_back.verify_visible
end

And(/^I can see the Breadcrumbs$/) do
  Breadcrumb.breadcrumb_div.verify_visible
end

Then(/^The Last Breadcrumb item should not be a link$/) do
  Breadcrumb.new.breadcrumbs.last.verify_html_not "<a"
end

Then(/^The Breadcrumb for the Article should end with the Article Title$/) do
  Breadcrumb.breadcrumbs.last.verify_text FigNewton.news_article_title
end

Then(/^The Breadcrumb for the Product Detail ends with the SKU and Manufacturer Name$/) do
  # TODO re-factor as this will fail with translations.
  product_crumb = "Home / Products / Resistor / Fixed Resistors / Resistor Fixed Single-Surface Mount / #{FigNewton.part_with_multiple_cart_option_sku} - #{FigNewton.part_with_multiple_cart_option_manu}"
  step "The Breadcrumb should be #{product_crumb}"
end

Then(/^The Breadcrumb for the Datasheets Detail ends with Datasheet Title$/) do
  # TODO re-factor as this will fail with translations.
  product_crumb = "Home / Datasheets / #{on(DatasheetsDetailPage).datasheet_title}"
  step "The Breadcrumb should be #{product_crumb}"
end

Then(/^The Breadcrumb should be (.*)$/) do |breadcrumb|
  Breadcrumb.new.verify_breadcrumb(breadcrumb)
end

And(/^Each Breadcrumb Item link should start with the Base Url$/) do
  # Remove the last item in the collection as it does not have link
  @breadcrumbs = Breadcrumb.new.breadcrumbs
  @breadcrumbs.pop
  @breadcrumbs.each do |item|
    item..verify_attribute('href', "#{$base_url}")
  end
end

