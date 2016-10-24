Feature: Verifying My account functionality in the header

  @smoke @full @desktop @tablet @qa_only
  Scenario: Verifying my account objects for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click on the Login Link in the header
    And I log in with the default user
    When I click on the user menu
    Then A drop down should appear with the proper links in it

  @smoke @full @desktop @tablet @qa_only
  Scenario: Verifying order history for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click on the Login Link in the header
    And I log in with the default user
    And I click on the user menu
    When I click on the order history link
    Then I should be on the Order History page

  @smoke @full @desktop @tablet @qa_only
  Scenario: verifying password link for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click on the Login Link in the header
    And I log in with the default user
    And I click on the user menu
    When I click on change your password
    Then I should be on the Password reset page

  @smoke @full @desktop @tablet @qa_only
  Scenario: verifying my profile settings link for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click on the Login Link in the header
    And I log in with the default user
    And I click on the user menu
    When I click on profile settings link
    Then I should be on the Profile Settings page

  @smoke @full @mobile @qa_only
  Scenario: Verifying my account objects for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click the hamburger menu in the header
    And I click on the Login Link in the header
    And I log in with the default user
    And I click the hamburger menu in the header
    When I click on the user menu
    Then A drop down should appear with the proper links in it

  @smoke @full @mobile @qa_only
  Scenario: Verifying order history for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click the hamburger menu in the header
    And I click on the Login Link in the header
    And I log in with the default user
    And I click the hamburger menu in the header
    And I click on the user menu
    When I click on the order history link
    Then I should be on the Order History page

  @smoke @full @mobile @qa_only
  Scenario: verifying password link for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click the hamburger menu in the header
    And I click on the Login Link in the header
    And I log in with the default user
    And I click the hamburger menu in the header
    And I click on the user menu
    When I click on change your password
    Then I should be on the Password reset page

  @smoke @full @mobile @qa_only
  Scenario: verifying my profile settings link for desktop and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    And I click the hamburger menu in the header
    And I click on the Login Link in the header
    And I log in with the default user
    And I click the hamburger menu in the header
    And I click on the user menu
    When I click on profile settings link
    Then I should be on the Profile Settings page


