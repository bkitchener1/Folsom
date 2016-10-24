When(/^I add "([^"]*)" items with part number "([^"]*)"$/) do |arg1, arg2|
  @item = AddToCartExternal.new(arg2, arg1)
end

When(/^I add non-US "([^"]*)" items with part number "([^"]*)" and source "([^"]*)"$/) do |arg1, arg2, arg3|
    @item = AddToCartExternalNonUS.new(arg2, arg1, arg3)
end

Then(/^The cart summary should display "([^"]*)"$/) do |arg|
  CartSummary.new.item_count_message.verify_text arg
end

Given(/^I visit the cart summary page$/) do
  CartSummary.open_page
end

And(/^There should be "([^"]*)" item in the cart$/) do |arg|
  page = CartSummary.new
  rows = page.item_row
  expect(rows.count).to eq(arg.to_i)
end

And(/^I delete the item with text "([^"]*)"$/) do |arg|
  CartSummary.new.delete_item(arg)
end

Then(/^The first item should display count "([^"]*)"$/) do |arg|
  CartSummary.new.overlay.verify_not_visible 120
  CartSummary.new.item_row[0].item_quantity.verify_text arg
end

And(/^I update the first item quantity to "([^"]*)"$/) do |arg|
  CartSummary.new.update_first_item_quantity(arg)
  $driver.wait_for_ajax
  sleep 5
end

Then(/^The secure checkout button should be disabled$/) do
  page = CartSummary.new
  expect(page.order_summary.continue.attribute("disabled")).to eq "true"
end

Then(/^The secure checkout button should be enabled$/) do
  CartSummary.new.wait_until(10,"text was #{page.order_summary.continue.attribute("disabled")}") do
    disabled = page.order_summary.continue.attribute("disabled")
    disabled == nil
  end
end

And(/^I remove the first item$/) do
  CartSummary.new.delete_first_item
end


Given(/^I have an item in my cart$/) do
  step 'I visit the arrow website'
  step 'I add "500" items with part number "1340091S9715673N7769"'
  step 'I visit the cart summary page'
end

# adding step for COP-28
Given(/^I have a Non-US item in my cart$/) do
  step 'I visit the arrow website'
  step 'I add "1000" items with part number "E02%3A0323_03825209" and source code "Europe"'
  step 'I visit the cart summary page'
end

# adding step for COP-28
Given(/^I have two items in my cart$/) do
  step 'I visit the arrow website'
  step 'I add "500" items with part number "1340091S9715673N7769"'
  step 'I add "1000" items with part number "E02%3A0323_03825209" and source code "Europe"'
end

And(/^the item is labeled "([^"]*)" with quantity "([^"]*)" and cost "([^"]*)" for a total of "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  page = CartSummary.new
  $driver.scroll_top
  page.verify_row = page.item_row.select{|item| item.text.include? text}.firstitem_row(arg1, arg2, arg3, arg4)
end

Given(/^I have (\d+) items in my cart$/) do |arg|
  step 'I visit the arrow website'
  step 'I add "5" items with part number "41888397S8776366N2606"'
  step 'I visit the arrow website'
  step 'I add "500" items with part number "1340091S9715673N7769"'

end

When(/^I click the trash can icon on the first item$/) do
  CartSummary.new.item_row.first.trash_can.click
end

And(/^I click the cancel button$/) do
  CartSummary.new.cancel.click
end

Then(/^the remove item validation modal should be visible$/) do
  CartSummary.new.remove_item_modal.verify_visible
end

Then(/^the remove item modal should display item text "([^"]*)"$/) do |arg|
  CartSummary.new.remove_item_modal.item_text.verify_text arg
end

And(/^the remove item modal should display mpn "([^"]*)"$/) do |arg|
  CartSummary.new.remove_item_modal.item_mpn.verify_text arg
end

And(/^the remove item modal should display quantity "([^"]*)"$/) do |arg|
  CartSummary.new.remove_item_modal.quantity.verify_text arg
end

And(/^the remove item modal should display item description "([^"]*)"$/) do |arg|
  CartSummary.new.remove_item_modal.item_text.verify_text arg
end

When(/^I update the first item CPN to "([^"]*)"$/) do |arg|
  CartSummary.new.update_first_item_cpn(arg)
end

Then(/^the first item should display CPN "([^"]*)"$/) do |arg|
  CartSummary.new.item_row[0].item_cpn.verify_text arg
end


And(/^I clear the item quantity$/) do
  page = CartSummary.new
  page.item_row[0].pencil.click
  page.quantity.clear
end

And(/^I set the item quantity to "([^"]*)"$/) do |arg|
  page = CartSummary.new
  page.item_row[0].pencil.click
  page.quantity.set_text(arg)
  page.modal_header.click
end

Then(/^the quantity is required error message is displayed$/) do
  page = CartSummary.new
  page.error_message.verify_text "Please enter a quantity to order"
end

Then(/^I should be on the cart summary page$/) do
  CartSummary.new.verify_visible
end

And(/^the first item should have a thumbnail$/) do
  CartSummary.new.first_item.thumbnail.verify_visible
end

And(/^the first item should have part number "([^"]*)"$/) do |arg|
  CartSummary.new.item_row[0].item_mpn.verify_text arg
end

And(/^the first item should have manufacturer name "([^"]*)"$/) do |arg|
  CartSummary.new.item_row[0].item_name.verify_text arg
end

And(/^the first item should have description "([^"]*)"$/) do |arg|
  CartSummary.new.item_row[0].item_desc.verify_text arg
end

And(/^the first item should be rohs compliant$/) do
  CartSummary.new.item_row[0].compliant.verify_visible
end

And(/^the first item should have an estimated ship date$/) do
  CartSummary.new.item_row[0].ship_date.verify_visible
end

And(/^the first item should display cost "([^"]*)"$/) do |arg|
  CartSummary.new.item_row[0].item_price.verify_text arg
end

And(/^the first item should display a total cost of "([^"]*)"$/) do |arg|
  CartSummary.new.item_row[0].item_total.verify_text arg
end

And(/^the first item should not be rohs compliant$/) do
  CartSummary.new.item_row[0].compliant.verify_not_visible
end

# update to have_promo_message from promo_message

Then(/^the promotional code message displays in the order summary$/) do
  page = CartSummary.new
  page.order_summary.expand_mobile_order_summary
  page.order_summary.have_promo_message.verify_visible
end

Then(/^the promotional code message should not display in the order summary$/) do
  page = CartSummary.new
  page.order_summary.expand_mobile_order_summary
  page.order_summary.have_promo_message.verify_not_visible
end

And(/^the first item should match the first item in the api$/) do
  page = CartSummary.new
  api = GetCartContents.new
  Money.use_i18n = true
  first_item = api.cart_item(0)
  item = first_item.unit_price*100
  item_cents = item / 100
  item_money = Money.new(item, "USD")
  total =  first_item.item_total*100
  total_money = Money.new(total, "USD")
  item_row = page.item_row[0]
  item_row.item_mpn.verify_text first_item.mpn.gsub(" ","").gsub("\\","")
  page.item_row[0].item_name.verify_text first_item.manufacturer
  page.item_row[0].item_desc.verify_text first_item.description
  page.item_row[0].item_quantity.verify_text first_item.quantity
  page.item_row[0].item_price.verify_text item_cents.to_f.round(4) #item_money.format
  page.item_row[0].item_total.verify_text total_money.format
  if first_item.compliant
    page.item_row[0].compliant.verify_visible
  else
    page.item_row[0].compliant.verify_not_visible
  end
end

And(/^the cart summary should display the total from the api in "([^"]*)"$/) do |arg|
  page = CartSummary.new
  page.order_summary.expand_mobile_order_summary
  api = GetCartContents.new
  Money.use_i18n = false
  cart_items = api.cart_items
  first =  cart_items.first
  total = first[1].item_total*100
  exchange_rate = CartHandover.new.get_exchange_rate(arg)
  adjusted_total = total * exchange_rate
  total_money = Money.new(adjusted_total,currency=arg)
  page.order_summary.total.verify_text total_money.format(:separator=>".")
end


When(/^I click the got a question box$/) do
  CartSummary.new.got_a_question.verify_present.click
end
#======================================================================================

When(/^I click the chat with us live box$/) do
  CartSummary.new.chatwithuslive.verify_present.click
end

Then(/^the chat with us live box does not display$/) do
  CartSummary.new.chatwithuslive.verify_not_visible
end

#======================================================================================

And(/^the cart order summary should display a total of "([^"]*)"$/) do |arg|
  page = CartSummary.new
  page.order_summary.expand_mobile_order_summary
  page.order_summary.total.verify_text arg
end

Then(/^the valid range error message appears$/) do
  CartSummary.new.error_message.verify_text "Please enter a number between"
end

Then(/^the incremental error message appears$/) do
  page = CartSummary.new
  page.error_message.verify_text "Please enter number in increments of"
end

Then(/^the minimum quantity error message appears$/) do
  page = CartSummary
  page.error_message.verify_text "Please enter number in increments of"
end

Given(/^I check out$/) do
  page = CartSummary.new
  $driver.scroll_top
  page.order_summary.checkout
end


And(/^I visit the cart summary page in "([^"]*)"$/) do |arg|
  CartSummary.new.open_page_in_language(arg)
end

Then(/^cart summary page text displays in "([^"]*)"$/) do |arg|
  CartSummary.new.verify_language(arg)
end

Then(/^edit modal text displays in "([^"]*)"$/) do |arg|
  CartSummary.new.edit_item_modal.verify_language(arg)
end

When(/^I click the pencil can icon on the first item$/) do
  CartSummary.new.item_row[0].pencil.click
end

Then(/^remove item modal text displays in "([^"]*)"$/) do |arg|
  CartSummary.new.remove_item_modal.verify_language(arg)
end

When(/^I add "([^"]*)" items with part number "([^"]*)" and source code "([^"]*)"$/) do |arg1, arg2, arg3|
  @item = AddToCartExternal.new(arg2, arg1, arg3)
end

And(/^I delete the item$/) do
  CartSummary.new.delete_first_item
end

Then(/^I should be redirected back to the original vendor site$/) do
  $driver.verify_url("http://www.silabs.com/products/Pages/default.aspx")
end

Then(/^The first item should display the count from the api$/) do
  @item = GetCartContents.new.cart_items.first


end