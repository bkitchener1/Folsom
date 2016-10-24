@desktop
Feature: RecentlyViewedModuleFeature

  @ARROW_1656 @full @mobile @tablet @desktop @wide
  Scenario: Users on ALL devices can see the Recently Viewed Modules on the Home Page
    Given I visit the Arrow Home Page
    When I find the Recently Viewed 'Reference Designs' Module
    When I find the Recently Viewed 'Datasheets' Module

  @ARROW_1656 @full @smoke @desktop
  Scenario: A NEW User to the Arrow site can see Featured/Default info on the Recently Viewed Reference Design Module
    Given I visit the Arrow Home Page
    Given I find the Recently Viewed 'Datasheets' Module
    And I can see Embedded Search in Recently Viewed section
    And I can see the correct title for Featured Datasheets
    And I can see lists of Recently Viewed Items

  @ARROW_1656 @full @smoke
  Scenario: A RETURN User to the Arrow site can see Cached info on the Recently Viewed Reference Design Module
    Given I visit a Reference Design Detail Page
    And I visit the Arrow Home Page
    And I find the Recently Viewed 'Reference Designs' Module
    Then I can see Embedded Search in Recently Viewed section
    And I CANNOT see the title for Featured Datasheets
    And I can see the correct title for Recently viewed Lists
    And I can see '1' items under Recently Viewed section

  @ARROW_1204 @full @smoke
  Scenario: A NEW User to the Arrow site can see Featured/Default info on the Recently Viewed Datasheets Module on All Devices
    Given I visit the Arrow Home Page
    Then I find the Recently Viewed 'Datasheets' Module
    And I can see Embedded Search in Recently Viewed section
    And I can see the correct title for Recently viewed Lists for new users
    And I CANNOT see the title for Recently Viewed Lists
    And I can see lists of Recently Viewed Items


  @ARROW_1204 @full @smoke
  Scenario: A RETURN User to the Arrow site can see Cached info on the Recently Viewed Datasheets Module on All Devices
#    Given I visit the Arrow Home Page
    Given I visit the Datasheets Detail page
    When I visit the Arrow Home Page
    When I find the Recently Viewed 'Datasheets' Module
    Then I can see Embedded Search in Recently Viewed section
    And I can see the correct title for Recently viewed Lists
    And I can see '1' items under Recently Viewed section

  @ARROW_1202 @full
  Scenario: User can search for Datasheets from Recently Viewed Sections on Home Page
    Given I visit the Arrow Home Page
    Given I find the Recently Viewed 'Datasheets' Module
    When I search for Recently Viewed Datasheets "test" from Home Page
    Then I am directed to the Products Search Results Page
    And My search term displays in the Search field

  @ARROW_1656 @full
  Scenario: User can search for Reference Designs from Recently Viewed Sections on Home Page
    Given I visit the Arrow Home Page
    Given I find the Recently Viewed 'Reference Designs' Module
    When I search for Recently Viewed Reference Designs "test" from Home Page
    Then I am directed to the Reference Design Listings Page
    Then My search term displays in the Search field