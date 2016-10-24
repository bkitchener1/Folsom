@TEL-1908
@mobile @tablet @desktop
  @full_cart
Feature: Update Item Quantity

Scenario: User updates quantity to valid quantity
  Given I have an item in my cart
  When I visit the cart summary page
  And I update the first item quantity to "6000"
  Then the first item should match the first item in the api

Scenario: User updates CPN
  Given I have an item in my cart
  When I update the first item CPN to "testcpn"
  Then the first item should display CPN "testcpn"

Scenario: User updates quantity to 0
  Given I have an item in my cart
  When I visit the cart summary page
  And I update the first item quantity to "0"
  Then the remove item validation modal should be visible

Scenario: User clears quantity and tries to continue
  Given I have an item in my cart
  When I visit the cart summary page
  And I clear the item quantity
  Then the quantity is required error message is displayed

Scenario: User changes quantity to value that is above stock value
  Given I have an item in my cart
  When I visit the cart summary page
  And I set the item quantity to "10000000"
  Then the valid range error message appears

Scenario: User changes quantity to value that is below minimum value
  Given I visit the arrow website
  And I add "4000" items with part number "50897000S6899936N8608"
  When I visit the cart summary page
  And I set the item quantity to "3000"
  Then the incremental error message appears