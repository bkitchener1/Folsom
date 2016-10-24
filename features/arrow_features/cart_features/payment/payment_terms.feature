@COP-14
@desktop @mobile @tablet
  @full_cart

Feature: Terms Payment Tests

  Scenario: As a terms users I should see the proper information when placing a Terms Payment and be able to place an order
    Given I log in with the terms user
    And I have an item in my cart
    And I click the checkout button
    Then I select existing address "Terms Approved Address"
    And I click the continue checkout button
    And I select the default shipping method
    When I click the continue checkout button
    And I select "Terms" payment type
    Then I should see a terms agreement message
    And a PO number field
    When I enter a Terms PO of "12345"
    And I click the continue checkout button
    Then I should see my PO number listed as "1234" in the summary screen
    And I should be able to submit my order

  Scenario: As a terms user that has selected an invalid address I should see an error when selecting terms payment
    Given I visit the payment page as a terms user
    And I select "Terms" payment type
    Then I should see an error message telling me I have no picked a valid terms address

    

