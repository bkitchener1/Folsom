@sanity @desktop @full
Feature: SiteSearchNavigationSanity
  As a User
  I can see Arrow Search Pages without exception

  Scenario: Arrow Website Search Sanity - Product Category
    Given I view search results for Product Category "Batteries"
    Then The Page Loads without any exceptions
    Then there is no error on the search results page

  Scenario: Arrow Website Search Sanity - Multiple Price Tiers
    Given I view search results for a Part with Multiple Price Tiers
    Then there is no error on the search results page
    Then The Page Loads without any exceptions

  Scenario: Arrow Website Search Sanity - Reference Designs
    Given I view search results for Reference Designs
    Then there is no error on the search results page
    Then The Page Loads without any exceptions

  Scenario: Arrow Website Search Sanity - Research and Events
    Given I view search results for the Arrow site for Research and Events
    Then there is no error on the search results page
    Then The Page Loads without any exceptions

  Scenario: Arrow Website Search Sanity - Arrow Home Page
    Given I visit the Arrow Home Page
    Then there is no error on the search results page
    Then The Page Loads without any exceptions

  Scenario: Search for product
    When I search for a specified product
    Then there is no error on the search results page
    Then the product is displayed
    And The Page Loads without any exceptions
