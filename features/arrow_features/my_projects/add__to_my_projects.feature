Feature: AddToMyProjectsFeature

  @ARROW_1692 @ARROW_912 @full @desktop @smoke
  Scenario: I add an new event to an empty calendar
    When I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I create a New Project 'TestProject' on the My Projects page
    Then I can see that the Project 'TESTPROJECT' has been created

  @ARROW_1336 @ARROW_1337 @full @desktop @smoke
  Scenario: Adding an Reference Design to a Project when User with Existing Project Logged in
    Given I visit the Arrow Home Page
    When I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I create a New Project 'TestProject' on the My Projects page
    And I visit a Reference Design Detail Page
    And I click Save to Project Image for the Event
    And I select the Project 'TestProject' from Project list
    When I save the Event to an Existing Project
    And I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    And I open the project 'TESTPROJECT' from Project List
    Then I can see "1" Reference Design listing on the Project Details page

  @ARROW_1338 @ARROW_1337 @full @desktop @smoke
  Scenario: Adding a Datasheet to a Project when User with Existing Project Logged in
    Given I visit the Arrow Home Page
    When I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I create a New Project 'TestProject' on the My Projects page
    And I visit the Datasheets Detail page
    And I click Save to Project Image for the Event
    And I select the Project 'TestProject' from Project list
    When I save the Event to an Existing Project
    And I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    And I open the project 'TESTPROJECT' from Project List
    Then I can see "1" Datasheet listing on Project Details page





