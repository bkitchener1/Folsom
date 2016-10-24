@COP-1
@desktop @mobile @tablet
  @full_cart
Feature: Payment Page

Scenario: As a user I should be able to pay using paypal
  Given I visit the payment page
  And I select "PayPal" payment type
  And I click the checkout button
  And I click the complete checkout button
  And I log in to paypal and complete my payment
  Then I should be on the confirmation page

