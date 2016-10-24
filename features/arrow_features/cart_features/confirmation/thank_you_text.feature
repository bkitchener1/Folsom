@TEL-1921
@desktop @mobile @tablet
  @full_cart
Feature: Order Confirmation page

Scenario: User sees tab and text on order confirmation page
  Given I visit the arrow login page
  And I login to arrow.com
  When I have submitted an order
  And I should be on the order confirmation page
  Then I see the order completed section and thank you text

