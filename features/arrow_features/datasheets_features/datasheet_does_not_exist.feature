@desktop
Feature: Parts With No Datasheet
  As a business, when we cannot display a datasheet, we should not display a datasheet preview.

  @BKT_1116 @smoke @full
  Scenario: When a Datasheet CANNOT be displayed on a PDP. Then the datasheet preview should be hidden from view
    Given I visit a Part Detail with NO Datasheet
    Then I CANNOT see the Datasheet Viewer

  @BKT_1116 @full @smoke
  Scenario: Users should see a useful message when no Datasheet preview is displayed on the PDP
    Given I visit a Part Detail with NO Datasheet
    Then I can see a message that the Datasheet is not available
