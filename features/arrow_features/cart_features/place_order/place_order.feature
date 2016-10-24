@desktop @mobile @tablet
  @full_cart
Feature: Place order page

Scenario: As a user I should be able to place an order
  Given I visit the payment page
  When I select "Arrange" payment type
  And I select the default address
  And I click the checkout button
  Then I should be on the place order page

