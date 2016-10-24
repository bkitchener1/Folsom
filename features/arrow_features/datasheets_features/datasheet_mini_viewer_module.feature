Feature: DatasheetMiniViewerModule
  As a user
  I want to be able to quickly access the Datasheet for a Product

  # Design change on datasheets caused datasheet header to be switched by manufacturer name.
  # Commenting the header step, needs to be updated after the design change is completed

  @ARROW_2031 @smoke @full
    @mobile @desktop
  Scenario: Users can see a Mini Datasheet Viewer on main Breakpoints
    And I visit a Part Detail with Datasheets
    Then I can see the Mini Datasheet Viewer
    #And The Mini Datasheet Viewer has a Header
    And The Mini Datasheet Viewer has an Image which is a smaller version of the Datasheet
    And The Mini Datasheet Viewer has a View Button
    And The Mini Datasheet Viewer has a Download Button

  @ARROW_2031 @full
    @mobile @tablet @phablet @desktop
  Scenario: Users can see a Mini Datasheet Viewer on minor Breakpoints
    And I visit a Part Detail with Datasheets
    Then I can see the Mini Datasheet Viewer
    #And The Mini Datasheet Viewer has a Header
    And The Mini Datasheet Viewer has an Image which is a smaller version of the Datasheet
    And The Mini Datasheet Viewer has a View Button
    And The Mini Datasheet Viewer has a Download Button

  @ARROW_2013 @full
    @desktop @tablet @mobile
  Scenario: The Mini Datesheet Viewers Buttons link correctly
    Given I visit a Part Detail with Datasheets
    Then The Mini Datasheet Viewer Download Button is correct
    Then The Mini Datasheet Viewer View Button is correct