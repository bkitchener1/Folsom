@api_dependent @desktop
Feature: SearchResultsOnDesktop
  Desktop users can see specific detail on the different Search Results Listing Page

  @ARROW_1439 @full @smoke
  Scenario: Desktop users can see Content Related detail when Searching for Content
    Given I have searched the Arrow site for Research and Events "a"
    When I find the First Research and Events Search Item
    Then I can see the Title for Research and Events Search Item
    And I can see the Description for the Research and Events Search Item
    And I can see the Date for the Research and Events Search Item

  @ARROW_1439 @full @smoke
  Scenario: Desktop users can Share and Add to Project an item when Searching for Content
    Given I have searched the Arrow site for Research and Events "a"
    When I find the First Research and Events Search Item
    And I can see an Add To Project Button for Research and Events Search Item
