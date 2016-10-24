Feature: Authors and Engineers

  @ARROW_1592 @full @smoke @qa_only @mobile @desktop
  Scenario: Users can see Sales person details on Desktop Devices
    Given I visit the Sales Person Page
    Then I can see the Sales Person's Name as the Title
    And I can see the Sales Person's Profile Picture

  @ARROW_1330 @full @desktop @mobile
  Scenario: Users views the Author Info page on Desktop device
    Given I visit a News Article on the Arrow site
    And I click the Author name
    Then I am taken to Author Info page
    And I can see the Author's Name as the Title
    And I can see the Author's Job Title
    And I can see the Author's Profile Picture
    And I can see the Author's Personal Details

  @ARROW_1901 @full @desktop
  Scenario: User clicks Read More for Author Description from Article page
    Given I visit a News Article on the Arrow site
    And I click 'Read More' Link for the Author Description
    Then I am taken to Author Info page