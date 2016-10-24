@api_dependent @desktop
Feature: PartsDetailLinking

  @ARROW_1995 @full @smoke
  Scenario: User can go directly to the Manufacturer Detail Page from Parts Details Page
    Given I visit a Part Detail with Multiple Cart Options
    Then The Manufacturer link is correct
    When I click on the Manufacturer Name on the Part Detail Page
    Then I am directed to the Manufacturer Detail Page