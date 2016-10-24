Feature: SearchResultsForDiscontinuedPart
  As a user I want to see if a product is discontinued from the search results page

  @ARROW_1145 @ARROW_2807 @full @smoke @desktop @tablet
  Scenario: User can see if a Part is discontinued on different desktop and tablet
    Given I have searched the Arrow site for a single Discontinued Part
    Then I can see that the Search Item is Discontinued
    And The button should show VIEW on Tablet and Desktop
    When When I click the VIEW button
    Then I can see a Description on the Product Detail Page

  @mobile @full @smoke
  Scenario: User can see if a Part is discontinued on different desktop and tablet
    Given I have searched the Arrow site for a single Discontinued Part
    Then I can see that the Search Item is Discontinued
    And The VIEW button should NOT show on mobile
