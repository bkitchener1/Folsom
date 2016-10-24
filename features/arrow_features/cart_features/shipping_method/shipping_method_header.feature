Feature:  Shipping Method Page
  @full_cart

  @desktop @tablet
Scenario: As a user, when I get to the shipping method page, I want to see the cart header
  Given I visit the shipping method page
  Then The cart header should be visible
  And The cart footer should be visible

  @mobile
Scenario: As a user, when I get to the shipping method page, I want to see the cart header
  Given I visit the shipping method page
  Then The cart header should be visible
  And The cart footer should not be visible

  