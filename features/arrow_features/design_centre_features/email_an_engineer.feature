@desktop
Feature: Email an engineer

  @ARROW_2801 @full @smoke
  Scenario: Customer can email an engineer
    When I visit the Engineers Listings Page
    Then I can send an email to an engineer

  @ARROW_2801 @full @smoke
  Scenario: Customer can cancel an email an engineer
    When I am sending an email to an engineer
    And I change my mind
    Then I can cancel sending

  @ARROW_2801 @full @smoke
  Scenario: Customer helped to complete form
    When I am sending an email to an engineer
    And I do not provide all required information
    Then I am informed of the errors the I need to correct