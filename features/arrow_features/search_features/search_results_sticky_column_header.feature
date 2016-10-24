@desktop
Feature: SearchResultsStickyColumnHeaders
  As a User I want the Title bar of the Columns to be sticky on the Search Results Page

  @BKT_376 @smoke @full
  Scenario: The Column headers of the Product Search Results page always displays
    Given I have searched the Arrow site for Product "ba"
    When I scroll down to the end of the Search Results
    Then The Search Results Columns stick to the Header
    And The Sticky Results Columns are visible

  @BKT_376 @full
  Scenario: The Column headers of the Reference Design Search Results page always displays
    Given I have searched the Arrow site for Reference Design "a"
    When I scroll down to the end of the Search Results
    Then The Search Results Columns stick to the Header
    And The Sticky Results Columns are visible

  @BKT_376 @full
  Scenario: The Column headers of the Research and Events Search Results page always displays
    Given I have searched the Arrow site for Research and Events "a"
    When I scroll down to the end of the Search Results
    Then The Search Results Columns stick to the Header
    And The Sticky Results Columns are visible

  @BKT_376 @full
  Scenario: The Column headers of the Product Search Results page always displays
    Given I have searched the Arrow site for Datasheet "bav"
    When I scroll down to the end of the Search Results
    Then The Search Results Columns stick to the Header
    And The Sticky Results Columns are visible