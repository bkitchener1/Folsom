@desktop
Feature: Customer Registration
  So I can register quickly
  I want to provide the minimum amount of information necessary when creating a new account
  As an Arrow.com customer

  @cart_smoke @full @COP_134
  Scenario: Customer creates account when checking out
    Given I have an item in my cart
    And I visit the cart summary page
    When I click the checkout button
    Then I can create an account on checkout and log in

  @cart_smoke @full @COP_138 @COP_135
  Scenario: Customer is logged in automatically after creating an account
    Given I Enable the Feature Flag 'RegistrationAutoLogin'
    When I create an account
    Then I am automatically logged in after clicking ok

  @cart_smoke @full @ARW_401 @COP_136
  Scenario: Customer accepts Terms and Conditions on registration page
    Given I have an item in my cart
    And I visit the cart summary page
    When I click the checkout button
#    Then I can view the registration terms of use
