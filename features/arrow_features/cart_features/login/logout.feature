@desktop @mobile @tablet

  @full_cart @cart_smoke

Feature:  Arrow Logout
  
Scenario: As an arrow user, When I log out of the cart, I should be logged out of arrow.com
  Given: I visit the arrow website
  And I visit the payment page
  When I log out from the cart page
  And I visit the arrow website
  Then I should not be logged in

Scenario: As an arrow user, When I log out of arrow.com, I should be logged out of the cart
  Given I visit the arrow login page
  And I login to arrow.com
  And I have an item in my cart
  When I log out from arrow.com
  And I visit the cart summary page
  Then I should not be logged in to the cart