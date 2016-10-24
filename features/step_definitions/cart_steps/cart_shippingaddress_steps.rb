Given(/^I am on the cart shipping address' page$/) do

  step 'I have an item in my cart'
  step 'I click the checkout button'
  step 'I log in with the default user'
end

Given (/^I should see the PO Box error message$/) do

  AddAddress.new.po_box_error
end
