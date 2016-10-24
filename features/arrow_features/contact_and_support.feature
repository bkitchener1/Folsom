@COP-165
@desktop @mobile @tablet
@full
Feature: Contact and Support page Feedback button redirect

  Scenario: Change the "Feedback" button to direct the user to the OpinionLab Comment Card
    Given I visit the Arrow Home Page
    And I click the Contact and Support link
    Then OpinionLabs window url should display "https://secure.opinionlab.com/ccc01/comment_card_d.asp"

