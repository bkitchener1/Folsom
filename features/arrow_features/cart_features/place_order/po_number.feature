@COP-13
@desktop @tablet @mobile
  @full_cart

  Feature: PO Number should only be required when making a terms payment, all other payment types should be optional

    Scenario: As a terms user setting up a terms payment should require a PO number
      Given I log in with the terms user
      And I have an item in my cart
      And I click the checkout button
      Then I select existing address "Terms Approved Address"
      And I click the continue checkout button
      Then I should be on the shipping method page
      When I click the continue checkout button
      And I select "Terms" payment type
      When I click the checkout button
      Then I should see an error saying the PO # is required
      When I enter a Terms PO of "12345"
      And I click the continue checkout button
      Then I should see my PO number listed as "1234" in the summary screen
      When I clear the PO number
      Then I should see an error saying the PO number is required for terms payments

    Scenario: As a terms user, the PO number should be optional when setting up a credit card payment
      Given I log in with the terms user
      And I have an item in my cart
      And I click the checkout button
      Then I select existing address "Terms Approved Address"
      And I click the continue checkout button
      Then I should be on the shipping method page
      When I click the continue checkout button
      And I select "Credit Card" payment type
      And I enter a Visa card
      Then I select the default address
      And I click the checkout button
      Then I should be on the place order page
      And a PO number field should be seen and be optional
