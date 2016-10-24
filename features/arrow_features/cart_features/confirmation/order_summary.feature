@COP-3
@desktop @mobile @tablet
  @full_cart
Feature: As an Arrow.com user, I want to see my order cost in the order summary box (Confirmation)

  Scenario: User views order confirmation page with 1 item purchased and no promo code used
    Given I visit the order confirmation page
    Then the order summary should display the total, subtotal, tax, wire transfer and shipping from the API
    And the order summary should display "1 ITEM"
    And the promotional code message should not display in the order summary

  Scenario: User views order confirmation page with 1 item purchased and a promo code was used
    Given I visit the payment page
    When I select "Arrange" payment type
    And I select the default address
    And I click the checkout button
    Then I should be on the place order page
    And I enter promotional code "12345"
    And I submit my order
    When I should be on the order confirmation page
    Then the order summary should display the total, subtotal, tax, wire transfer and shipping from the API

  Scenario: User views order confirmation page with 1 item purchased and payment is wire transfer
    Given I visit the payment page
    And I select "Wire Transfer" payment type
    And I finish checking out
    When I should be on the order confirmation page
    Then the order summary should display the total, subtotal, tax, wire transfer and shipping from the API

  Scenario: User views order confirmation page with 2 items purchased
    Given I visit the arrow login page
    And I login to arrow.com
    Given I have 2 items in my cart
    And I submit my order
    When I should be on the order confirmation page
    Then the order summary should display "2 ITEMS"
    And the order summary should display the total, subtotal, tax, wire transfer and shipping from the API

