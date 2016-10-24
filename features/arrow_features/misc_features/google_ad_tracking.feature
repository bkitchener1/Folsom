@desktop
Feature: GoogleAdTracking

  @ARROW_1842 @sanity @full @smoke
    Scenario: The Footer contains a GA Tag attribute
    Given I visit the Arrow Home Page
    Then The Footer Element has a GA Tag

  @ARROW_1842 @full
    Scenario: The Header contains a GA Tag attribute
    Given I visit the Arrow Home Page
    Then The Header Element has a GA Tag