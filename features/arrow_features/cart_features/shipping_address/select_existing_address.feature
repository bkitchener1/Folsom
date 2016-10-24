@desktop @mobile @tablet
  @full_cart
Feature:  Select Shipping Address
  
Scenario: User can select an existing address
  Given I visit the shipping address page
  When I select existing address "123 S Colorado"
  And I click the checkout button
  Then I should be on the shipping method page
