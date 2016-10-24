@TEL-1918
@desktop @mobile @tablet
  @full_cart
Feature:  Cart Summary Multi Currency

Scenario: User changes currency on cart summary page
  Given I visit the shipping address page
  When I change the currency to "EUR"
  And I visit the cart summary page
  Then the cart summary should display the total from the api in "EUR"

