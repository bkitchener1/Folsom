@COP-22 @COP-23 @COP-24
  @full_cart

@desktop @mobile @tablet
Feature: Promotional code

  @qa_only
  Scenario: Valid QA promotional code entered
    Given I visit the Place Order page
    And I enter the QA promotional code
    Then I should see a message telling me the QA code was applied
    And The QA promotional code should be calculated correctly
    And The grand total should be correctly adjusted with the promotional discount

  Scenario: Invalid promotional code entered
    Given I visit the Place Order page
    And I enter a invalid promotional code
    Then I should see a message telling me the code is invalid

  Scenario: As a user I should be able to remove a promotion code that I have entered from my order
    Given I visit the Place Order page
    And I enter the QA promotional code
    Then I should see a message telling me the QA code was applied
    And I click the remove link to remove the promotional code
    Then the order summary should display the correct total
    And I should not see a message telling me the QA code was applied.

  Scenario: As a user I should be able to add a promotional code after I have removed a promotion code
    Given I visit the Place Order page
    And I enter the QA promotional code
    Then I should see a message telling me the QA code was applied
    And I click the remove link to remove the promotional code
    Then I should not see a message telling me the QA code was applied.
    Then the order summary should display the correct total
    And I enter the QA promotional code
    Then I should see a message telling me the QA code was applied


  @prod_only
  Scenario: Valid Production promotional code entered
    Given I visit the Place Order page
    And I enter the Production promotional code
    Then I should see a message telling me the Production code was applied
    And The Production promotional code should be calculated correctly
    And The grand total should be correctly adjusted with the promotional discount


