
@ARW-851
@desktop @mobile @tablet @cart_smoke
@full
Feature: Customer Registration new

  Scenario: User clicks on "Create Account" on the Login page
    Given I visit the arrow login page
    And I click on Create Account on the login page
    Then I should be on the short registration form page
    And there is the ability to create an account

  Scenario: User successfully creates an account
    When I create an account
    Then I am automatically logged in after clicking ok


  Scenario: Customer creates account when checking out
    Given I have an item in my cart
    And I visit the cart summary page
    When I click the checkout button
    Then I can create an account on checkout and logged in
    Then I am back on the cart shipping address page