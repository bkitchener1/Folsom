@TEL-2101
@desktop @mobile @tablet
  @full_cart

Feature: As an Arrow.com user I want to see the credit card form when I select credit card as my payment option
  Scenario: User is on the payment page then all payment options should be available and payment icons present
    Given I visit the payment page
    When I click Payment Method
    Then Credit Card, PayPal, Arrange, and Wire Transfer should be available options
    And Payment method icons should be present

  Scenario: User is on the payment page and selects Credit Card then Credit card form should show and the amount of characters in the credit card and CV field
    Given I visit the payment page
    When I select "Credit Card" payment type
    Then The Credit Card form should be displayed
    When I enter "4111 1111 1111 1111 1111" in the Card Number field
    Then Only "4111  1111  1111  1111 " should be displayed in Card Number field
    When I enter "4A3351" in the CCV field
    Then Only "4335" should be displayed in CCV field

 Scenario: User enters a expired card date
    Given I visit the payment page
    When I enter a EXPIRED credit card
    And I select the default address
    And I click the checkout button
    Then I should receive an error telling me the card is expired

  Scenario: User enters information in to payment fields and continues checkout then comes back to the payment page, Credit card should be masked and CV code erased
    Given I visit the payment page
    When I enter a Visa card
    And I select the default address
    And I click the checkout button
    When I go back to payment page
    Then The Credit card number should display as "************1111"
    And the CV code should be ""
    When I click into the Credit card number
    Then The Credit card should display as "4111 1111 1111 1111"

  Scenario: User uses a Discover card as payment
    Given I visit the payment page
    When I enter a Discover card
    And I select the default address
    And I click the checkout button
    Then I should be able to submit my order

  Scenario: User does not enter information into all required fields
    Given I visit the payment page
    When I click the continue checkout button
    Then I should see all fields highlighted in red
    And receive an error specifying each field that needs to have information entered

   Scenario: User is a terms user then Credit Card, PayPal, Terms, Arrange, and Wire Transfer should be available types
     Given I visit the payment page as a terms user
     When I click Payment Method
     Then Credit Card, PayPal, Terms, Arrange, and Wire Transfer should be available payment options

