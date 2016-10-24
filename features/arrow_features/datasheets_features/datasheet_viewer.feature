@desktop
Feature: DatasheetViewer

  @mobile @tablet @phablet @desktop
  @ARROW_1432 @full
  Scenario: User can see the Datasheet Viewer on All devices
    And I visit a Part Detail with Datasheets
    Then I can see the Datasheet Viewer

  @ARROW_1435 @full @smoke
  Scenario: User can see the Datasheet Viewer Module on the Datasheet Detail Page
    Given I visit the Datasheets Detail page
    Then I can see the Datasheet Viewer

  @ARROW_1435 @full
  Scenario: User can select another Datasheet page by entering the Page Number in the Datasheet Toolbar
    Given I visit the Datasheets Detail page
    And I can see the number of Datasheet Pages available
    When I enter the last Page number and press Enter
    #Then I am taken to the last Datasheet page
    And The Last Datasheet Page is the active thumbnail in the Datasheet Viewer Carousel

  @ARROW_1432 @full
  Scenario: Users can Toggle through the Datasheets using the Datasheet Viewer Chevrons
    Given I visit the Datasheets Detail page
    When I click the "Right" Chevron of the Datasheet Viewer
    Then I can see Page "2" of the Datasheet
    When I click the "Left" Chevron of the Datasheet Viewer
    Then I can see Page "1" of the Datasheet

  @ARROW_1433 @full
  Scenario: Users can Toggle through the Datasheets by clicking on a Thumbnail
    Given I visit the Datasheets Detail page
    Then I can see Thumbnails for the Datasheet
    When I click on Datasheet Thumbnail "2"
    Then I can see Page "2" of the Datasheet

  @ARROW_1433 @full @smoke
  Scenario: The Number of Thumbnail Slides matches the Total in the Datasheet Toolbar
    Given I visit the Datasheets Detail page
    Then The Total Pages from the Datasheet Toolbar matches the amount of Datasheet Thumbnails