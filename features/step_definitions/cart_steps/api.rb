Then(/^I store the cart api response for item "([^"]*)"$/) do |arg|
  @api = GetCartContents.new
end