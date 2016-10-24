Feature: Header

  As a user
  I want to see a the Header section with specific functionality.


  @smoke @full @desktop
    Scenario: The Header is visible.
    Given I visit the Arrow Home Page
    Then The header is visible

  @smoke @full @desktop
  Scenario: Check telephone icon appears in header
    Given I visit the Arrow Home Page
    Then I will see the telephone icon


  @ARROW_315 @smoke @full @desktop
  Scenario: The Divisions menu in the Header is not visible by default
    Given I visit the Arrow Home Page
    Then The Divisions Menu is NOT visible

  @ARROW_315 @smoke @full @desktop
  Scenario: Users can Open and Close the Divisions Menu from the Global Header
    Given I visit the Arrow Home Page
    When I click on the Arrow Divisions button
    Then The Divisions Menu is displayed
    When I close the Arrow Divisions Menu
    Then The Divisions Menu is NOT visible

  @ARROW_315 @full @smoke @desktop
    Scenario: The Division Menu has Useful Links
    Given I visit the Arrow Home Page
    When I click on the Arrow Divisions button
    Then I can see at least "1" Arrow Divisions Link
    And Each Arrow Divisions Link has a Title and Description

  @ARROW_1116 @full @desktop
  Scenario: Search Bar is visible with default text
    Given I visit the Arrow Home Page
    Then I can see Search Bar
    And I can see Default Text
    And I can see the Search text
    And I can see Search Button

   @ARROW_2004 @full @mobile
   Scenario: Mobile Users have to tap the Magnify icon to activate the Search functionality
     Given I visit the Arrow Home Page
     Then The Header Search input visibility is "false"
     When I click on the Mobile search icon
     Then The Header Search input visibility is "true"

   @mobile @desktop @tablet @smoke
   Scenario: Verifying Header on Arrow Home
     Given I visit the Arrow Home Page
     Then The Arrow header should be displayed correctly
     When I visit the arrow login page
     And I log in with the default user
     And I visit the Arrow Home Page
     Then The Arrow header should be displayed correctly for a logged in user

