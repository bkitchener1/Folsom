@desktop @tablet @mobile @wide @max @full 
Feature: ReferenceDesignDetailPageRelatedModule
  As A User
  I can see the Related Reference Design Module On Various Arrow Pages

  Scenario: The tiles in the related reference design module will have all appropriate fields
    Given I visit the Reference Design Detail Page
    Then the Related Reference Design module will be visible
    And the related reference design has a title
    And the related reference design has a manufacturer name
    And the related reference design has a share button
    And the related reference design has a save to projects button
    And the related reference design has a date

  @BKT_1158 @ARROW_1046
  Scenario: User can see Related Reference Design Module on Reference Design Detail page on All devices
    Given I visit the Reference Design Detail Page
    Then the Related Reference Design module will be visible
    And the Related Reference Design module will have title "REFERENCE DESIGNS"
    And the correct number of reference designs will be displayed for my device size

  @ARROW_1623
  Scenario: User can see Related Reference Design Module on Reference Design Landing page on All devices
    Given I visit the Reference Design Landing Page
    Then the Related Reference Design module will be visible
    And the Related Reference Design module will have title "REFERENCE DESIGNS"
    And the correct number of reference designs will be displayed for my device size
  
  @ARROW_1417
  Scenario: User can see Related Reference Design Module on Manufacturer Detail Page on All devices
    Given I visit the Manufacturers Detail Page
    Then the Related Reference Design module will be visible
    And the Related Reference Design module will have title "REFERENCE DESIGNS"
    And the correct number of reference designs will be displayed for my device size
