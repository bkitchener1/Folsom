@api_dependent @desktop
Feature: PartsDetailSpecificationSection
  As a user, I want to see the Part Specifications module on the PDP so I can get detailed information about a product

  @ARROW_583 @full @smoke
  Scenario: User can see a Specification section on the Parts Details page on different breakpoints
    And I visit a Part Detail with Cross References
    Then I can see a list of Specifications

