@api_dependent @desktop
Feature: PartDetailStock
  As a user I want to see stock levels based on my location

  @ARROW_185 @full @smoke
  Scenario: User can see the Stock amount for Parts that are in Stock
    Given I visit a Part Detail with Multiple Cart Options
    And I see the first buying option
    Then I can see the Part's Stock Count
    And The Stock Level for the Buying Option is more than zero

  @ARROW_185 @full @smoke
  Scenario: User CANNOT see the Stock amount for Parts that are out of Stock
    Given I visit a Part Detail with Back Order option
    Then The Stock Level for the Buying Option should NOT be displayed