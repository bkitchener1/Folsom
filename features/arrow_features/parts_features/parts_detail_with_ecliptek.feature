@api_dependent @desktop
Feature: PartsDetailEcliptek
  As a user I want to see any Ecliptek buying options available to me for a particular product

  @ARROW_778 @full @smoke
    Scenario: User can see a Ecliptek buy option on the Parts Detail Page
    Given I visit a Part Detail with Ecliptek
    Then I can see a Ecliptek section
    And the Part Detail page contains a Ecliptek link to a 3rd party site
    And I can see the Stock Status Text
    And I can see the Get By Text
    And I CANNOT see the Contact information


