Feature: ProjectListingPageFeature

  @ARROW_2124 @full @smoke @desktop
  Scenario: User views Project Listing page with No Projects in it on Desktop Devices
    Given I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    Then I can see 'How to use my Projects' heading
    And I can see 4 Items in How to use My Projects section
    And I can see How to use my project Item Image
    And I can see How to use my projects Item Description


  @ARROW_2124 @full @mobile @phablet @tablet
  Scenario: User views Project Listing page with No Projects in it on Mobile Devices
    Given I visit the Project Listings Page
    Then I can see 'How to use my Projects' heading
    And I can see 4 Items in How to use My Projects section
    And I can see How to use my project Item Image
    And I can see How to use my projects Item Description

  @ARROW_1935 @full @desktop
  Scenario: User can Sort Projects on My project Listing Page
    Given I visit the Arrow Home Page
    And I log in as an Arrow customer
    And I clear all the existing project
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    And I visit the Project Listings Page
    And I can see sort controls

  @ARROW_1936 @full @desktop @smoke
  Scenario: User can see Project on My project Listing Page
    Given I visit the Arrow Home Page
    And I log in as an Arrow customer
    And I clear all the existing project
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    And I visit the Design Centre Landing Page
    And I click "My Projects" from Side nav
    And I open the project 'TESTPROJECT' from Project List







