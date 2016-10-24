@ARROW_1877
@desktop @tablet @mobile
  @full
Feature: My Account

  Scenario: Logged-in customer wishes to view account details
    Given I log in with the second user
    Then I am able see all links related to My account in the drop down
    When I click "Order History" in the My Accounts drop down
    Then I should be on the Order History page
    When I click the user icon in the header
    And I click "Profile Settings" in the My Accounts drop down
    Then I should be on the Profile Settings page
    When I visit the arrow website
    And I click the user icon in the header
    And I click "Change your Password" in the My Accounts drop down
    Then I should be on the Password reset page


