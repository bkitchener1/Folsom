@TEL-1907
@desktop @mobile @tablet
  @full_cart
Feature:  As an Arrow.com user, I want to see a sum of the total number of items in my cart (Cart Summary)

Scenario: User views cart summary page with 0 items in their cart
  Given I visit the cart summary page
  Then The cart summary should display "0 items in your shopping cart"

Scenario: User views cart summary page with 1 item in their cart
  Given I have an item in my cart
  When I visit the cart summary page
  Then The cart summary should display "1 item in your shopping cart"

Scenario: User views cart summary page with 2 items in their cart
  Given I have 2 items in my cart
  When I visit the cart summary page
  Then The cart summary should display "2 items in your shopping cart"







  