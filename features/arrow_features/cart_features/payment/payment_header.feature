@full_cart
Feature:  Payment Page
  @desktop
Scenario: As a user, when I get to the payment page, I want to see the cart header
  Given I visit the payment page
  Then The cart header should be visible
  And The cart footer should be visible

  @mobile @tablet
Scenario: As a user, when I get to the payment page, I want to see the cart header
  Given I visit the payment page
  Then The cart header should be visible
  And The cart footer should not be visible

  