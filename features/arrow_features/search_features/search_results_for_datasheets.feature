Feature: SearchResultsForDatasheets

  @desktop
  @ARROW_1130 @full
  Scenario: Users can see related Parts for Datasheets when they click to View Products
    Given I have searched the Arrow site for Datasheet "diodes"
    And I find the first Datasheet Item with more than 1 Related Part
    When I click on View Products of the Datasheet Item
    Then I can see no more than 3 Related Parts
    And I can see the matching Parts to the Datasheet

    @mobile @desktop
  @ARROW_1130 @full @smoke
  Scenario: Users can see related Parts for a Datasheets merged into one column
    And I have searched the Arrow site for Datasheet "diodes"
    And I find the first Datasheet Item with more than 1 Related Part
    Then I can see no more than 3 Related parts in the Part No. column

