@desktop
Feature: DesignCentreLandingPage

  @ARROW_1242 @full @smoke
  Scenario: Design Centre Arrow promoted tools
    Given I visit the Design Centre Landing Page
    Then I can see '5' Arrow Promoted Tools
    And I can see Tool name
    And I can see Tool Image
    And I can see 'FIND OUT MORE' link
    When I click 'FIND OUT MORE' link
    Then I can see 'CLOSE' link
    And I can see Tools Description
    And I can see Cross Icon in Tools Description Section

  @ARROW_1242 @full
  Scenario: Clicking Cross Icon from Design Centre Tools Description Section
    Given I visit the Design Centre Landing Page
    When I click 'FIND OUT MORE' link
    And I can see the Tools Description of first Tool
    When I click Cross Icon from Tools Description Section
    Then I CANNOT see Tools Description
    And I can see 'FIND OUT MORE' link

  @ARROW_1226 @full
  Scenario: Users can see a Side Bar Navigation on Design Center Landing Page
    Given I visit the Design Centre Landing Page
    Then I can see the Side Bar Navigation
    And The Side Bar has a Dashboard link
    And The Side Bar has a My Projects link
    And The Side Bar has a Arrow Engineers link
    And The Side Bar has 'New Project' button

  @ARROW_1981 @full @smoke
  Scenario: User can see My Project Promo on Design Center Landing Page
    Given I visit the Design Centre Landing Page
    Then I can see promo section with '3' Promo Items
    And I can see the Promo Item Icon
    And I can see the Promo Item Title
    And I can see the Promo Item Description
    And I can see the Button 'Create a New Project'


  @ARROW_1984 @full
  Scenario: User can see Latest Project on Design Center Detail Page
    When I log in as an Arrow customer
    And I clear all the existing project
    And I visit the Design Centre Landing Page
    And I click 'New Project' button from Side Nav
    And I create a New Project 'TestProject'
    And I visit the Design Centre Landing Page
    Then I can see the lists of Latest Project


