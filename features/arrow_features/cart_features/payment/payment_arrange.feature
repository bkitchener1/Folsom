@COP-12
@desktop @mobile @tablet
  @full_cart
Feature: Payment Page

Scenario: As a user I should be able to arrange payment
  Given I visit the payment page
  When I select "Arrange" payment type
  Then I should see text telling me customer service will contact me
  When I select the default address
  And I click the checkout button
  Then I should be able to submit my order




