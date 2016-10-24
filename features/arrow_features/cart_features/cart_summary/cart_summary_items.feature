@CCO-1910
@desktop @mobile @tablet
  @full_cart
Feature:  Cart Summary Page

  Scenario: User adds non-RoHS compliant product to cart
  Given I visit the arrow website
  And I add "58" items with part number "41987004S6490817N2668"
  And I visit the cart summary page
  Then There should be "1" item in the cart
  And the first item should match the first item in the api


Scenario: User adds RoHS compliant product to cart
  Given I visit the arrow website
  And I add "1000" items with part number "1340091S9715673N7769"
  And I visit the cart summary page
  Then the first item should match the first item in the api
  And There should be "1" item in the cart