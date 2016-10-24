@full_cart
Feature:  Place Order Page

  @desktop
  Scenario: As a user, when I get to the place order page, I want to see the cart header
    Given I visit the Place Order page
    Then The cart header should be visible on the place order page
    And The cart footer should be visible

  @mobile @tablet
  Scenario: As a user, when I get to the place order page, I want to see the cart header
    Given I visit the Place Order page
    Then The cart header should be visible on the place order page
    And The cart footer should not be visible

