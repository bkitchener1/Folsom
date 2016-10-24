@TEL-1911
@mobile @tablet @desktop
  @full_cart
Feature: As an Arrow.com user, I can remove an item from my cart if I no longer want to buy it (Cart Summary)

  Scenario: User removes all items from the cart
    Given I have an item in my cart
    When I remove the first item
    And I visit the cart summary page
    Then There should be "0" item in the cart
    And the cart order summary should display a total of "0"
    And the header cart icon should display "" items
    And The cart summary should display "0 items in your shopping cart"

  Scenario:  User cancels removing an item from the cart
    Given I have an item in my cart
    And I visit the cart summary page
    When I click the trash can icon on the first item
    And I click the cancel button
    And I visit the cart summary page
    Then There should be "1" item in the cart
    And the header cart icon should display "1" items
    And the cart summary should display the total from the api in "USD"
    And The cart summary should display "1 item in your shopping cart"

  Scenario: User sees remove validation modal before an item is removed
    Given I have an item in my cart
    And I visit the cart summary page
    When I click the trash can icon on the first item
    And the remove item modal should display mpn "BAV99"
    And the remove item modal should display item description "BAV99 / FAIRCHILD SEMICONDUCTOR"
    Then the remove item validation modal should be visible