@api_dependent @desktop
Feature: PartDetailPipeline
  As a user I want to see pipeline inventory for products/buying options that have that information available

  @ARROW_1161 @full @smoke
  Scenario: User can see Pipeline link on the Part Detail Page
    Given I visit a Part Detail with Pipeline
    Then I can see a Pipeline Link on the Part Detail Page

  @ARROW_1161 @full @smoke
  Scenario: User can see more Pipeline information on the Part Detail Page
    Given I visit a Part Detail with Pipeline
    When I click on the Pipeline Link on the Part Detail Page
    Then I can see a Tooltip with detailed Pipeline information
    When I close the Tooltip
    Then I cannot see the Tooltip