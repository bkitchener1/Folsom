@TEL-1927
@desktop @mobile @tablet
  @full_cart @wip
Feature: Confirmation Page Payment

Scenario: User sees payment selected during checkout on order confirmation when payment method is credit card
  Given I visit the order confirmation page
  Then the confirmation page payment section displays "CREDIT CARD"
  And the confirmation page payment section displays "****************"
  And the confirmation page payment section displays "Exp: **/****"
  And the confirmation page payment address displays "Test User"
  And the confirmation page payment address displays "3033122135"
  And the confirmation page payment address displays "123 S Colorado"
  And the confirmation page payment address displays "Denver"

Scenario: User sees payment selected during checkout on order confirmation when payment method is wire transfer and billing address is not selected
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
  And I should be able to submit my order
  #When I visit the order confirmation page
  Then the confirmation page payment section displays "Wire Transfer"
  Then the confirmation page payment section displays "Please use the link below to print the wire transfer instructions. Please note: Processing a wire transfer could delay the shipment of your parts by several days."
  And the confirmation page payment section displays "View/Print Wire Transfer Instructions"

Scenario: User views wire transfer instructions in English on order confirmation page
  Given I visit the arrow login page
  And I login to arrow.com
  And I have an item in my cart
  And I click the checkout button
  And I select the default address
  And I click the checkout button
  And I select the default shipping method
  And I click the checkout button
  And I select "Wire Transfer" payment type
  And I click the checkout button
  And I should be able to submit my order
  And I click the View/Print Wire Transfer Instructions link

Scenario: User views wire transfer instructions in Chinese on order confirmation page
  Given I visit the arrow login page
  And I login to arrow.com
  And I have an item in my cart
  And I visit the cart summary page in "Chinese"
  And I click the checkout button
  And I select the default address
  And I click the checkout button
  And I select the default shipping method
  And I click the checkout button
  And I select "电汇" payment type
  And I click the checkout button
  And I should be able to submit my order
  When the View/Print Wire Transfer Instructions link should be "https://static2.arrow.com/wireinstructions/verical_wiring_instructions_zh-cn.pdf"

  @cart_smoke
Scenario: User sees payment selected during checkout on order confirmation when payment method is arrange
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
  And I should be able to submit my order
  And I am on the correct confirmation page for my environment
  Then the confirmation page payment section displays "ARRANGE PAYMENT"
  Then the confirmation page payment section displays "After this order has been placed, a customer service representative will contact you to arrange payment."
  And the confirmation page payment address displays "Test User"
  And the confirmation page payment address displays "3033122135"
  And the confirmation page payment address displays "123 S Colorado"
  And the confirmation page payment address displays "Denver"

Scenario: User sees payment selected during checkout on order confirmation when payment method is paypal
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
  #And I log in to paypal and complete my payment
  Then the confirmation page payment section displays "PAYPAL"
  Then the confirmation page payment section for paypal displays "Once you have reviewed and submitted your order, you will then be redirected to the Paypal website to complete the transaction."
  And the confirmation page payment address displays "Test User"
  And the confirmation page payment address displays "3033122135"
  And the confirmation page payment address displays "123 S Colorado"
  And the confirmation page payment address displays "Denver"

Scenario: User sees payment selected during checkout on order confirmation when payment method is terms
  Given I log in with the terms user
  And I have an item in my cart
  And I click the checkout button
  And I select existing address "450 Lincoln St"
  And I click the checkout button
  And I select the default shipping method
  And I click the checkout button
  And I select "Terms" payment type
  And I enter a Terms PO of "1234567"
  And I click the checkout button
  And I should be able to submit my order
  Then the confirmation page payment section displays "PURCHASE ON TERMS"
  And the confirmation page payment section displays "By using this payment method, you agree to having the order total added to your terms account with Arrow."
  And the confirmation page payment section displays "PO Number 1234567"
