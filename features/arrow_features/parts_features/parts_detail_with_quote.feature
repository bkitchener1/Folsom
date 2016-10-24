
Feature: PartsDetailQuote
  As a user I want to see any Quote buying options available to me for a particular product

  @ARROW_775 @full @smoke @desktop
  Scenario: User can see a Quote button on the Parts Detail Page
    Given I visit a Part Detail with Quote
    Then I can see a Quote section
    And the Part Detail page contains a Quote link to a 3rd party site
    And I can see the Stock Status Text
    And I can see the Contact information

