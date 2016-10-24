@api_dependent
Feature: PartsDetailDiscontinued
  As a user I want to see any Verical buying options available to me for a particular product

  @BKT_891 @smoke @desktop
  Scenario: Desktop Users can see a if a Part is Discontinued on the Parts Detail Page
    Given I visit a Discontinued Part Detail
    Then I can see a Discontinued Notification

  @BKT_891 @full @mobile @tablet @desktop
  Scenario: Users can see a if a Part is Discontinued in all Breakpoints
    And I visit a Discontinued Part Detail
    Then I can see a Discontinued Notification
