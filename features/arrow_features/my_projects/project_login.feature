@mobile
Feature: DesignCenterProjectLogin

  @COP-145 @full @smoke
  Scenario: User can login from Design Center bottom 'Create New Project' button
    Given I visit the Arrow Home Page
    And I click Design Center from the MegaMenu
    And I click the bottom Create New Project button while not logged in
    Then I click on the Login or Sign Up Link in the modal
    And I log in with the default user
    Then I am redirected to the Design Center and I am logged in

  @COP-145 @full @smoke
  Scenario: User can login from Design Center left nav 'Create New Project' button
    Given I visit the Arrow Home Page
    And I click Design Center from the MegaMenu
    And I click 'New Project' button from Side Nav
    Then I click on the Login or Sign Up Link in the modal
    And I log in with the default user
    Then I am redirected to the Design Center and I am logged in