@ARW-3836
@desktop
@sanity @smoke

Feature: MyArrow log in, remove radio buttons
  As an arrow.com user, when I view the login page I do not see radio buttons to select between arrow.com and MyArrow since I will always be logging in to arrow.com from the login page.

  Scenario: When the user views the login page, radio buttons are not displayed
    Given I visit the Arrow Home Page
    And I click on MyArrow in the Header
    And I visit the arrow login page
    Then I cannot see the radio buttons

