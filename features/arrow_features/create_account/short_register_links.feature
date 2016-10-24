@desktop
Feature: Short Register Links
  As an arrow.com user that is not logged in, I see the new short registration form when I select to register when creating a new project in the design center

  @ARROW_395 @full @smoke
  Scenario: Short Register Link from Design Center Side Nave
    Given I visit the Design Centre Landing Page
    When I click 'New Project' button from Project Module
    And I click the register button
    Then The Register Link is correct

  @ARROW_395 @full @smoke
  Scenario: Short Register Link from Design Center Promo Module
    Given I visit the Design Centre Landing Page
    When I click 'New Project' button from Promo Module
    And I click the register button
    Then The Register Link is correct