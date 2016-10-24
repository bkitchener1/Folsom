Feature: Header

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying New Header on mobile
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    Then The new Arrow header should be displayed correctly
    When I click the hamburger menu in the header
    Then The hamburger menu should open and display properly

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Login Link in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user two
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Login" with the hamburger menu open
    Then I should be on the "Login" page
    When I log in with the default user
    Then I should see my user as logged in

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying MyArrow in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user four
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "MyArrow" with the hamburger menu open
    Then I should be on the "MyArrow" page

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Language in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader'
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Language" with the hamburger menu open
    Then I can see the correct languages listed in the hamburger drop down

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Currency in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Currency" with the hamburger menu open
    Then The currency dropdown should be displayed in the hamburger menu

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying cart in new header
    Given I 'Enable' the Feature Flag  'NewHeader' as user two
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Cart" with the hamburger menu open
    Then I should be on the cart summary page

  @mobile @tablet @smoke @full @qa_only
  Scenario: Clicking the Arrow logo returns user to home page
    Given I 'Enable' the Feature Flag  'NewHeader' as user three
    And I visit the Research and Events Landing Page
    When I click the Arrow Logo in the new header
    Then I should be taken back to the home page

  @desktop @smoke @full @qa_only
  Scenario: Verifying Language selections
    Given I 'Enable' the Feature Flag 'NewHeader' as user four
    And I visit the Arrow Home Page
    And I click on the Language in the new header
    Then I can see the correct languages listed in the hamburger drop down

  @desktop @smoke @full @qa_only
  Scenario: Verifying Login Link for Desktop
    Given I 'Enable' the Feature Flag  'NewHeader' as user three
    And I visit the Arrow Home Page
    Then I click on the Login Link in the header
    When I log in with the default user
    Then I should see my user as logged in

  @desktop @smoke @full @qa_only
  Scenario: Verifying Currency for Desktop
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    And click "Currency" with the hamburger menu open
    Then The currency dropdown should be displayed in the hamburger menu

  @desktop @smoke @full @qa_only
   Scenario: Verifying contact number in header
    Given I 'Enable' the Feature Flag  'NewHeader' as user two
    And I visit the Arrow Home Page
    Then Contact number should appear in the header correctly

  @desktop @smoke @full @qa_only
  Scenario: Verifying live support in header
    Given I 'Enable' the Feature Flag  'NewHeader' as user two
    And I visit the Arrow Home Page
    Then The live support option should appear in the header

  @desktop @smoke @full @qa_only
  Scenario: Verifying MyArrow in header
    Given I 'Enable' the Feature Flag  'NewHeader' as user four
    And I visit the Arrow Home Page
    And click "MyArrow" with the hamburger menu open
    Then I should be on the "MyArrow" page
