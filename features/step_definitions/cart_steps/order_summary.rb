Then(/^a new browser window displays and goes to the liveperson site$/) do
  expect($driver.window_handles.count).to eq 2
  $driver.switch_to.window( $driver.window_handles.last )
  expect($driver.current_url).to eq "https://server.iad.liveperson.net/hc/18784960/?cmd=file&file=visitorWantsToChat&site=18784960&byhref=1&SV!skill=Arrow%20Support"
end

Then(/^the got a question box does not display$/) do
  CartSummary.new.got_a_question.verify_not_visible
end

Given(/^I click the checkout button$/) do
  CartOrderSummary.new.checkout
end

Then(/^the order summary should display the total, subtotal, tax, wire transfer and shipping from the API$/) do
  confirmation = Confirmation.new
  number = confirmation.get_order_number
  api = GetSalesOrderHistoryDetails.new(number)
  CartOrderSummary.new.verify_totals(api.total, api.subtotal, api.tax_total, api.shipping_total,api.wire_transfer)
end

And(/^the order summary should display "([^"]*)"$/) do |arg|
  CartOrderSummary.new
end

Then(/^the order summary should display the correct total$/) do
  CartOrderSummary.new.verify_total_math
end


And(/^I enter the QA promotional code$/) do
  CartOrderSummary.new.enter_promo(FigNewton.promo_codes.qa_promo)
end

Then(/^I should see a message telling me the QA code was applied$/) do
  CartOrderSummary.new.verify_promo_text(FigNewton.promo_codes.qa_promo_message)
end

And(/^The QA promotional code should be calculated correctly$/) do
  @promo_discount= FigNewton.promo_codes.qa_promo_discount
  @item_total= CartOrderSummary.new.get_item_total
  @item_total_float= @item_total.gsub("$","").to_f
  @item_total_amount= @item_total_float*100
  @expected_promo= @item_total_amount/@promo_discount
  @expected_promo_money= Money.new(@expected_promo, "USD").format
  @promo_total= CartOrderSummary.new.get_promo_text
  expect(@promo_total).to eq (@expected_promo_money)
end

And(/^The grand total should be correctly adjusted with the promotional discount$/) do
  CartOrderSummary.new.verify_total_promo_math
end

And(/^I enter a invalid promotional code$/) do
  CartOrderSummary.new.enter_promo("shouldnotwork")
end

Then(/^I should see a message telling me the code is invalid$/) do
  CartOrderSummary.new.promo_error_text("The promo code shouldnotwork is no longer applicable to this order.")
end


And(/^I enter the Production promotional code$/) do
  CartOrderSummary.new.enter_promo(FigNewton.promo_codes.prod_promo)
end

Then(/^I should see a message telling me the Production code was applied$/) do
  CartOrderSummary.new.verify_promo_text(FigNewton.promo_codes.prod_promo_message)
end

And(/^The Production promotional code should be calculated correctly$/) do
  @promo_discount= FigNewton.promo_codes.prod_promo_discount
  @item_total= CartOrderSummary.new.get_item_total
  @item_total_float= @item_total.gsub("$","").to_f
  @item_total_amount= @item_total_float*100
  @expected_promo= @item_total_amount/@promo_discount
  @expected_promo_money= Money.new(@expected_promo, "USD").format
  @promo_total= CartOrderSummary.new.get_promo_text
  expect(@promo_total).to eq (@expected_promo_money)
end


And(/^I click the remove link to remove the promotional code$/) do
  CartOrderSummary.new.promo_remove_code
end

Then(/^I should not see a message telling me the QA code was applied\.$/) do
  CartOrderSummary.new.verify_promo_text_removed
end

Then(/^The Order Summary should be displayed$/) do
  CartOrderSummary.new.order_summary_present
end

And(/^The Total should be displayed$/) do
  CartOrderSummary.new.total_present
end


And(/^A message about adding a promotional code at the end of checkout$/) do
   CartOrderSummary.new.have_promo("Have a promotional code? Enter it at the end of the checkout process.")
end

And(/^The Total, Item Total, Shipping, and Tax should be displayed$/) do
  page= CartOrderSummary.new
  page.total_present
  page.tax_present
  page.shipping_present
  page.item_total_present
end

And(/^I switch language to (.*)$/) do |language|
  page = CartHeader.new
  page.switch_language(language)
end


And(/^I switch the currency to (.*)$/) do |currency|
  page = ArrowHeader.new
  page.select_currency(currency)
end

Then(/^The order summary should show the costs in the correct format combination for (.*)$/) do |format|
  page = CartOrderSummary.new
  page.order_summary_toggle.click
  @currency= Regexp.new FigNewton.currency.send(format)
  @currency_total= @currency === page.total_text.text
  expect(@currency_total).to be true
  @currency_tax= @currency === page.tax_total.text
  expect(@currency_tax).to be true
  @currency_item= @currency === page.item_total.text
  expect(@currency_item).to be true
  @currency_shipping= @currency === page.shipping_total.text
end

Then(/^the order summary should display the total from the api$/) do
  api = GetPendingSalesOrder.new
  CartOrderSummary.new.verify_totals(api.total, api.subtotal, api.tax_total, api.shipping_total,api.wire_transfer)
end


