@TEL-1912
@desktop @mobile @tablet
  @full_cart
Feature: As an Arrow.com user, I want to see the order summary box with a summary of my order (Cart Summary)

  Scenario: User views cart summary page with 0 items in their cart
    Given I visit the cart summary page
    Then the order summary should display a total of "0.00"

  Scenario: User views cart summary page with 1 item in their cart
    Given I have an item in my cart
    When I visit the cart summary page
    Then the order summary should display the total from the api

  Scenario: Non-Terms user views cart summary page
    Given I am logged in
    When I visit the cart summary page
    Then the promotional code message displays in the order summary

  Scenario: Terms user views cart summary page
    Given I log in with the terms user
    When I visit the cart summary page
    Then the promotional code message should not display in the order summary







  