@desktop
Feature: ContentTagFiltersModule

  Background:
    Given I visit the Research and Events Landing Page

  @ARROW_1303 @full @smoke
  Scenario: User can see Page Filters on the Research and Events Page
    Then I can see Page Filters
    And Only the First Page Filter selected by default

  @ARROW_1303 @full @smoke
  Scenario: User can see Content Filter Tags on the Research and Events Page
    Then I can see Content Filter Tags on the Research and Events page

  @ARROW_1303 @full
  Scenario: User can see Clear is the first Content Tag
    Then The First Tag is a Clear
    When I press the Clear Tag
    Then No Filter Tags are Active
