@desktop @mobile @tablet
  @full_cart @cart_smoke

Feature: Shipping Method Page

Scenario: As a user when I select a shipping method the total should be correct
  Given I visit the shipping method page
  When I select shipping method "$14.99 - Express Saver"
  Then The order summary should display a shipping charge of "$14.99"
  And the order summary should display the total from the api
