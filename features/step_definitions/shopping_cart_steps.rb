When(/^I click on Cart in the Header to Expand it$/) do
  ShoppingCart.new.click_to_expose_cart
  ShoppingCart.new.cart_div.verify_visible
end

And(/^I click on item "(\d+)" in the Cart$/) do |index|
  ShoppingCart.new.open_cart_item(index)
end

Then(/^I can see the matching Item I added to Cart$/) do
  @cart_item = ShoppingCart.new.get_cart_item(1)
  @cart_item.cart_item_sku.verify_text @part_sku
  @cart_item.cart_item_manu.verify_text @manu_name
  @cart_item.cart_item_price.verify_text @total
  @cart_item.cart_item_qty.verify_text @qty.to_s.sub("000",",000")
end

Then(/^My Cart should have "([^"]*)" item in it$/) do |arg|
  ShoppingCart.cart_qty.verify_text arg
end


And(/^The Cart shows a Summary of my Cart contents$/) do
  ShoppingCart.cart_summary.verify_text 'Showing 1 of 1 item'
end

And(/^The Cart Total is correct$/) do
  ShoppingCart.cart_total.verify_text @total
end

Then(/^The Shopping Cart url is correct$/) do
  $driver.verify_url"#{$base_url}/cart"
end