@desktop
Feature: Filter Search By Product Category

  @ARROW_1133 @full @smoke
  Scenario: Customer can filter by category
    When I search for a specified product
    Then I can see filtering options

  @ARROW_1133 @full @smoke
  Scenario: Customer filters search results by category
    When I search for a specified product
    Then I can filter by category