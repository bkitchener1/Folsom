@COP-26
@desktop @mobile @tablet
@full_cart
Feature: As an Arrow.com user I can only select credit card as a payment method for foreign currency
  Scenario Outline: User is on the payment page then only CC payment option should be available when currency is non us
    Given I visit the payment page
    And I can see that the currency is set to USD by default
    When I change the currency to "<arg>"
    Then I should see informational message "Only Credit Card Payments are allowed for Non-USD currencies."
    When I click Payment Method
    Then Credit Card should be only available option
    And credit card Payment method icons should be present
    Examples:
      | arg  |
      | EUR  |
      | KRW  |
      | AUD  |
      | GBP  |
      | MXN  |
      | BRL  |
      | HKD  |
      | MYR  |
      | CAD  |
      | INR  |
      | SGD  |
      | CNY  |
      | JPY  |
      | TWD  |



