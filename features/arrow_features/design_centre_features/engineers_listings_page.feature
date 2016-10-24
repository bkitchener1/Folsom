
Feature: EngineersListingsPage
  As a user I want to see a list of engineers in grid form

  @ARROW_2778 @full @smoke @desktop
  Scenario: Users can see a List of Engineers in Grid Form
    Given I visit the Engineers Listings Page
    Then I can see a Grid of Engineers
    And I can see at least "1" Engineer

  @ARROW_2778 @full @desktop
  Scenario: Users can Load More Engineers
    Given I visit the Engineers Listings Page
    Then I can see "20" Engineers
    When I Load More Engineers
    And I can see at least "21" Engineer

  @ARROW_2778 @full @mobile @tablet @phablet @wide @desktop
  Scenario: The Engineer Listings show specific Information on all Devices
    Given I visit the Engineers Listings Page
    Then I can see the Engineers Name
    And I can see that the Engineer's Profile has a background Image
    And I can see a Button to message the Engineer

  @ARROW_2789 @full @desktop
  Scenario: Users can see up to 4 Tags and a Link to the Engineer's Profile page when they hover over the Engineer's Profile
    Given I visit the Engineers Listings Page
    When I hover over the Engineer Profile
    Then I can see up to "4" Tags related to the Engineer
    And I can see a Button that directs to the Engineer's Profile Page

  @ARROW_2789 @full @mobile
  Scenario: Mobile users CANNOT see the Engineers Availability
    Given I visit the Engineers Listings Page
    Then I CANNOT see the Engineers Availability

  @ARROW_2789 @full @desktop
  Scenario: Desktop users can see the Engineer's Availability
    Given I visit the Engineers Listings Page
    Then I can see the Engineer's Availability


  @ARROW_2776 @full @desktop
    Scenario: As a customer, I want to have support options presented clearly and prominently
      Given I visit the Engineers Listings Page
      Then I can see options for support with 3 options icons

  @BKT_1148 @sanity @desktop
    Scenario: Customer can see engineers at all statuses
    When I visit the Engineers Listings Page
    Then I can see offline and online engineers
