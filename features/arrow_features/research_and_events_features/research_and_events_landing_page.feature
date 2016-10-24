Feature: ResearchEventsLandingPage

  @ARROW_1300 @smoke @mobile @phablet @tablet @desktop
  Scenario: Users can see Section headers on the Research Events Landing Page on different screen sizes
    Given I visit the Research and Events Landing Page
    Then I can see at least "1" section headers in black

  @ARROW_1300 @full @smoke @mobile @desktop
  Scenario: The Research and Events Landing Page has a Grid of News and Video Content
    And I visit the Research and Events Landing Page
    And Each Section should contain at least "1" article or event
