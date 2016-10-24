Feature: VideoLandingPage
  As a user I want to see a Videos Landing Page [Desktop, Tablet and Mobile]

  @ARROW_1388 @full @smoke @mobile @tablet @desktop
  Scenario: The Videos Landing Page has a Grid of Video Content
    And I visit the Videos Landing Page
    Then I can see "1" filterable sections of Content
    And There are at least one Videos displayed
