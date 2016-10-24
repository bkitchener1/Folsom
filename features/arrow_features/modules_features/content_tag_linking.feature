@desktop
Feature: ContentTagLinking
  As a user I want to link to the tag page from any tag the site

  @ARROW_1651 @full @smoke
  Scenario: Content on the Research and Events Landing Page has Tags that conform
    Given I visit the Research and Events Landing Page
    When I find the first News Article on the Research and Events Page
    Then The Content Tags links conform