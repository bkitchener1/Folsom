
@desktop @mobile @tablet
@full_cart
Feature: Cart Translation

  Scenario: Shipping address page translated
    Given I visit the shipping address page
    When I change language to "german"
    Then The Shipping Address page should display correctly in "german"
    When I change language to "chinese"
    Then The Shipping Address page should display correctly in "chinese"
    When I change language to "french"
    Then The Shipping Address page should display correctly in "french"
    When I change language to "italian"
    Then The Shipping Address page should display correctly in "italian"
    When I change language to "spanish"
    Then The Shipping Address page should display correctly in "spanish"
    When I change language to "english"
    Then The Shipping Address page should display correctly in "english"
    




