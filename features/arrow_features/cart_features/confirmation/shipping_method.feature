@TEL-1752
@desktop @mobile @tablet
  @full_cart
Feature: Order Confirmation page Shipping Method


Scenario: User sees shipping method selected during checkout on Confirmation page when order only has 1 product shipping from US Origin
  Given I visit the arrow login page
  And I login to arrow.com
  When I have submitted an order
  And I am on the correct confirmation page for my environment
  Then the order confirmation shipping method displays "Shipping Method"
  And the order confirmation shipping method displays "1 item ships from US Origin"
  And the order confirmation shipping method displays "A tracking number for your shipment will be emailed to you once your item ships."
  And the order confirmation shipping method displays the shipping method selected earlier

Scenario: User sees shipping method selected during checkout on Confirmation page when order only has 1 product shipping from Non-US Origin
  Given I visit the arrow login page
  And I login to arrow.com
  When I add "1000" items with part number "E02%3A0323_03825209" and source code "EUROPE"
  When I submit my order for non-us origin
  And I am on the correct confirmation page for my environment
  Then the order confirmation shipping method displays "Shipping Method"
  And the order confirmation shipping method displays "1 item ships from Non-US Origin"
  And the order confirmation shipping method displays "A tracking number for your shipment will be emailed to you once your item ships."
  And the order confirmation shipping method displays the shipping method selected earlier

Scenario: User sees shipping method selected during checkout on Confirmation page when order only has 2 products shipping from US Origin and 2 products shipping from Non-US Origin
  Given I visit the arrow login page
  And I login to arrow.com
  And I have an item in my cart
  And I add "1000" items with part number "E02%3A0323_03825209" and source code "EUROPE"
  When I submit my order for us and non us origin
  And I should be on the order confirmation page
  Then the order confirmation shipping method displays "Shipping Method"
  And the order confirmation shipping method displays "1 item ships from Non-US Origin"
  And the order confirmation shipping method displays "1 item ships from US Origin"
  And the order confirmation shipping method displays "A tracking number for your shipment will be emailed to you once your item ships."
  And the order confirmation shipping method displays the shipping method selected earlier