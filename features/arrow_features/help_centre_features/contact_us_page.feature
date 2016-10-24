@desktop @tablet @mobile
Feature: ContactUsPage

  @ARROW_967 @full
  Scenario: Users can use the Contact Us Page to email Arrow
    Given I visit the Contact Us Page
    Then I can see an Email Link

  @ARROW_970 @ful
  Scenario: Users can use the Contact Us Page to initiate a Chat Session
    Given I visit the Contact Us Page
    Then I can see a Customer Support Button
    And I can see an Online Chat Button

  @ARROW_1773 @full
  Scenario: Users can use the Contact Us Page to Leave Feedback
    Given I visit the Contact Us Page
    Then I can see a Leave Feedback Button

  @ARROW_1394 @full
  Scenario: Users can use the Contact Us Page to Phone Arrow
    Given I visit the Contact Us Page for "Australia"
    Then I can see a Phone Link

  @ARROW_1967 @full
  Scenario: The Contact Us Page body Title changes to match the User's Country of origin
    Given I visit the Contact Us Page for "Canada"
     Then The Contact Us Page Body Title shows "Canada"

  @ARROW_1802 @full
  Scenario: Users can see 4 Regions of Arrow Contacts
    Given I visit the Contact Us Page
    Then I can see "4" Regions of Arrow Contacts

  @ARROW_1802 @full
  Scenario: Users can see Contact information for Regions
    Given I visit the Contact Us Page
    Then I can see at least "1" Region
    Then The Country Item should have a Flag Icon
    And The Country Item should have a Title
    And The Country Item should have a Phone Number


