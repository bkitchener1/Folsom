@TEL-1922
@desktop @mobile @tablet
  @full_cart
Feature: Order Confirmation page

Scenario: User sees shipping address selected during checkout on order confirmation
  Given I visit the arrow login page
  And I login to arrow.com
  When I have submitted an order
  And I am on the correct confirmation page for my environment
  Then the order confirmation address should display "3033122135"
  Then the order confirmation address should display "123 S Colorado"
  Then the order confirmation address should display "Denver, AL 80246-8001"
  Then the order confirmation address should display "US"

