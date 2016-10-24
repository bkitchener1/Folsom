@ARW-761
@desktop @mobile @tablet
 @full @smoke

Feature: Create New Login splash page

  Scenario: Login as user with MyArrow account to see Login Splash Page
    Given I visit the Arrow Home Page
    When I visit the arrow login page
    When I can login with MyArrow user
    Then I can see the new Login Splash Page

  Scenario: Login as user with MyArrow account and choose to stay on arrow.com
    Given I visit the Arrow Home Page
    When I visit the arrow login page
    When I can login with MyArrow user
    When I click the "Go to arrow.com" button on the splash page to be on arrow
    Then I am logged in and returned to the search results page

  Scenario Outline: Login as user with MyArrow account and go to components
    Given I visit the Arrow Home Page
    When I visit the arrow login page
    When I can login with MyArrow user
    When I click the Login button and select region "<region>"
    When I click the "Go to MyArrow" button on the splash page
    Then I am logged in and redirected to the components "<region>" page
  Examples:
  | region  |
  |  na     |
  |  arrowce|
  |  arrowse|
  |  arrowne|
  |  arrowap|
  |  arrowna|

  Scenario: Login as user without a MyArrow account
    Given I visit the arrow website
    And I add "1" items with part number "1340091S9715673N7769"
    And I visit the cart summary page
    And I click on the Login Link in the header
    And I log in with the default user
    Then I visit the cart summary page
    Then I should be logged in