@desktop
Feature: As a user I want to see two selected engineers

  @smoke @full @ARROW_2773
  Scenario: Customer can see two Engineer promos on the Design Centre landing page
    When I visit the Design Centre Landing Page
    Then I can see two engineer promos


  @ARROW_2773 @smoke @full @BKT_927
  Scenario: Engineering promos are correctly formed
    When I visit the Design Centre Landing Page
    Then I can see that the engineer profile is correctly formed