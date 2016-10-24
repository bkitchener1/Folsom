@desktop
Feature: SearchTermPersistence
  As a user, I want my search term to persist in the search field until I navigate away from the search results page or start a new search

  Background:
    Given I have searched the Arrow site for Product "bav"

  @ARROW_618 @full @smoke
  Scenario: Users esearch term displays in the Search Term field on the Search Results Page
    Then My search term displays in the Search field

  @ARROW_618 @full @smoke
  Scenario: User Applies a filter and the Search term persists
    When I select the checkbox Filter for Manufacturer 'Vishay'
    Then My search term displays in the Search field

