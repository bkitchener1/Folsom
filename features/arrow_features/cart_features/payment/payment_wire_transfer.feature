@COP-21
@desktop @mobile @tablet
  @full_cart
Feature: Wire Transfer Payment

Scenario: As a user I want the order summary to show the cost of a wire transfer
  Given I visit the payment page
  When I select "Wire Transfer" payment type
  Then I should see the wire transfer fee message
  And A note informing me of a possible delay in shipping
  And A link to a wire transfer document should be present
  When I select the default address
  And I click the checkout button
  And The order summary should display a wire fee of "$25.00"

