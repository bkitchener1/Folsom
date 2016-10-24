@full_cart
Feature:  Shipping Address Page Header and Footer

  @desktop
Scenario: As a user, when I get to the shipping address page, I want to see the cart header
  Given I visit the shipping address page
  Then The cart header should be visible
  And The cart footer should be visible

  @tablet @mobile
Scenario: As a user, when I get to the shipping address page, I want to see the cart header
  Given I visit the shipping address page
  Then The cart header should be visible
  And The cart footer should not be visible


  