Feature: ProjectDetailPage

  @ARROW_1278 @full @desktop
  Scenario: User can see Project Detail and can Rename the Project
    Given I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    And I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    When I open the project 'TESTPROJECT' from Project List
    Then I can see the Project Title
    And I can see Date Created
    And I can see Date Modified
    And I can see icons 'Edit,Copy,Delete'
    And I can rename the project

  @ARROW_1699 @full @desktop
  Scenario: User can see Project Detail for a Project with No Content
    Given I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    Then I can see Help Text block
    And I can see 'Create A Design' button
    And I can see 'View Reference Designs' button
    And I can see '4' Help Item
    And I can see Help Item Icon
    And I can see Help Item Title
    And I can see Help Item Description

  @ARROW_1298 @full @desktop
  Scenario: User can see Contributor list for the Project
    Given I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    And I visit the Event Detail Page
    And I click Save to Project Image for the Event
    And I select the Project 'TestProject' from Project list
    When I save the Event to an Existing Project
    And I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    And I open the project 'TestProject' from Project List
    Then I can see Number of Contributors
    And I can see list of users




