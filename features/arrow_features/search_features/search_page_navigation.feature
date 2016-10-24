
@desktop @mobile @tablet
Feature: Search result page navigation

  @ARW-839 @full @smoke
  Scenario: Customer can page forward and backwards
    Given I have searched the Arrow site for Product "ba"
    Then I should be on page "1" of the search results
    When I click the page forward button in search results
    Then I should be on page "2" of the search results
    When I click the page forward button in search results
    Then I should be on page "3" of the search results
    When I click the page back button in the search results
    Then I should be on page "2" of the search results
    When I click the page back button in the search results
    Then I should be on page "1" of the search results