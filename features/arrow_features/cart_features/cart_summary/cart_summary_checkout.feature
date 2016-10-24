@TEL-1918
@desktop @mobile @tablet
  @full_cart

Feature:  Cart Summary Page

  @cart_smoke

Scenario: User tries to proceed to checkout with no items in cart
  Given I visit the cart summary page
  When I click the checkout button
  Then I should be on the cart summary page

Scenario: User tries to proceed to checkout with items in cart but not logged in
  Given I have an item in my cart
  And I visit the cart summary page
  When I click the checkout button
  And I log in with the default user
  Then I should be on the shipping address page

Scenario: User tries to proceed to checkout with items in cart and is already logged in
  Given I have an item in my cart
  And I am logged in
  And I visit the cart summary page
  When I click the checkout button
  Then I should be on the shipping address page
