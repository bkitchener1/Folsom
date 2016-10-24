@desktop
Feature: DatasheetToolbarModule

  @ARROW_1431 @smoke @full
  Scenario: Users can see the Datasheet Toolbar with certain Element on the Parts Detail Page on different window sizes
    And I visit a Part Detail with Datasheets
    Then I can see the Datasheet Toolbar
    And The Datasheet Toolbar's Counter visibility is "<counter_visibility>"
    And I can see a Add to Favourite Icon in the Datasheet Toolbar
    And I can see a Download Button in the Datasheet Toolbar

  @ARROW_1431 @full
  Scenario: The Download Button in the Datasheets Toolbar of the PDP is correct
    Given I visit a Part Detail with Datasheets
    Then The Datasheet Toolbar's Download Button is correct

  @ARROW_1435 @smoke @full
  Scenario: The Download Button in the Datasheets Toolbar of the Datasheets Detail Page is correct
    Given I visit the Datasheets Detail page
    Then The Datasheet Toolbar's Download Button is correct