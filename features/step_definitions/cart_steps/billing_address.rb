Given(/^I visit the payment page as the second user$/) do
  step 'I log in with the second user'
  step 'I have an item in my cart'
  step 'I click the checkout button'
  step 'I have already added an address'
  step 'I select the default address'
  step 'I click the checkout button'
  step 'I select the default shipping method'
  step 'I click the checkout button'
end