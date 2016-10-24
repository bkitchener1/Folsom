Given(/^I request the pricing API$/) do
  @api = HealthCheck.new.execute_api_request
end

Given(/^I request the api '(.*)'$/) do|api_url_path|
  api_url = "#{$base_url}#{api_url_path}"
  @api = GenericApi.new(api_url)
  @response = @api.response
end

Then(/^The API loads without Errors$/) do
  expect(@response == nil || @response == '').to be_falsy, "API call returns Empty Response or Null Response"
  response_body = @api.json
  expect(response_body['error'] == nil).to be_truthy, "API Response body contains Error : #{response_body['error']}"
end

Then(/^The pricing API is returning correctly$/) do
  healthcheck = @api.json
  pricing_response = healthcheck["Data"][1]
  expect(pricing_response["Working"]).to be true
  expect(pricing_response["Data"]["Status"]["StatusCode"]).to eq 101
end

Given(/^I visit the Cairo API healthcheck page$/) do
  CairoHealthCheck.new
end

Given(/^I query the api for a back ordered item$/) do
  @api = SearchAjax.new
  @api.search_bav99
  items = @api.get_backordered_items
  @backordered_item = items.first
end

