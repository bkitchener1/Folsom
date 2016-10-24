@desktop
Feature: CreateNewProjectsFeature

  @ARROW_1274  @full @smoke
  Scenario: Logged in User Creates a new Project from Left Nav menu on Design Center Landing Page
    Given I visit the Arrow Home Page
    When I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    When I click 'New Project' button from Side Nav
    Then I can see Create Project popup
    When I create a New Project 'TestProject'
    Then I am taken to Project detail page
    And I delete the project


  @ARROW_1274  @full @smoke
  Scenario: Logged in User Creates a new Project from New Project Tile on Project Listing Page
    When I visit the Arrow Home Page
    And I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    When I click 'New Project' Tile from Project Listing
    When I create a New Project 'TestProject'
    Then I am taken to Project detail page
    And I delete the project

  @ARROW_1305  @full @smoke
  Scenario: User Can duplicate a project
    When I log in as an Arrow customer
    And I clear all the existing project
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    And I click Duplicate Project Image from Project Detail Page
    And I create a Duplicate project 'duplicate_project'
    Then I can see Duplicate project Title on Project Detail Page


