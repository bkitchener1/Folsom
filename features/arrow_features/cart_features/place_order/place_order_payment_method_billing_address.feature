@COP-27
@desktop @mobile @tablet
  @full_cart

Feature: View payment method and billing address selected on the Place order page

  Scenario: User sees payment method selected during checkout on Place order page when payment method is credit card
    Given I visit the arrow login page
    And I login to arrow.com
    Then I have a shopping cart to place my order for US origin item
    #And the place order page shipping address displays the shipping address selected earlier
    Then place order page payment method should display "Exp: 10/2018"
    Then place order page billing address should display "Billing Address"

  Scenario: User sees payment selected during checkout on place order page when payment method is wire transfer and billing address is selected
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I click the checkout button
    And I select the default address
    And I click the checkout button
    And I select the default shipping method
    And I click the checkout button
    When I select "Wire Transfer" payment type
    And I select the default address
    And I click the checkout button
    Then the place order page payment section displays "Wire Transfer" payment method
    Then place order page billing address should display "Billing Address"

  Scenario: User sees payment selected during checkout on place order page when payment method is paypal and billing address is selected
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I click the checkout button
    And I select the default address
    And I click the checkout button
    And I select the default shipping method
    And I click the checkout button
    And I select "PayPal" payment type
    And I select the default address
    And I click the checkout button
    And I click the complete checkout button
    Then the place order page payment section displays "PAYPAL"
    Then place order page billing address should display "Billing Address"

  Scenario: User sees payment selected during checkout on place order page when payment method is arrange and billing address is selected
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I click the checkout button
    And I select the default address
    And I click the checkout button
    And I select the default shipping method
    And I click the checkout button
    And I select "Arrange" payment type
    And I select the default address
    And I click the checkout button
    Then the place order page payment section displays "ARRANGE PAYMENT" payment method
    Then place order page billing address should display "Billing Address"

  Scenario: User sees the link to payment method page during checkout on Place order page
    Given I visit the arrow login page
    And I login to arrow.com
    Then I have a shopping cart to place my order for US origin item
    Then place order page payment method should display "Exp: 10/2018"
    Then place order page payment link should display "https://qacart.arrow.com:8443/#/payment"
    Then place order page billing address should display "Billing Address"






