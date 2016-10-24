@COP-27
@desktop @mobile @tablet
  @full_cart

Feature: View payment method and billing address on the Place order page when billing address is not selected

  Scenario: User sees payment selected during checkout on place order page when payment method is wire transfer and billing address is not selected
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I click the checkout button
    And I select the default address
    And I click the checkout button
    And I select the default shipping method
    And I click the checkout button
    When I select "Wire Transfer" payment type
    And I click the checkout button
    Then the place order page payment section displays "Wire Transfer" payment method
    Then place order page billing address should display "No billing address was selected" in the billing address field

  Scenario: User sees payment selected during checkout on place order page when payment method is arrange and billing address is not selected
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I click the checkout button
    And I select the default address
    And I click the checkout button
    And I select the default shipping method
    And I click the checkout button
    And I select "Arrange" payment type
    And I click the checkout button
    Then the place order page payment section displays "ARRANGE PAYMENT" payment method
    Then place order page billing address should display "No billing address was selected" in the billing address field

  Scenario: User sees payment selected during checkout on place order page when payment method is paypal and billing address is not selected
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I click the checkout button
    And I select the default address
    And I click the checkout button
    And I select the default shipping method
    And I click the checkout button
    And I select "PayPal" payment type
    And I click the checkout button
    And I click the complete checkout button
    Then the place order page payment section displays "PAYPAL"
    Then place order page billing address should display "No billing address was selected" in the billing address field