@desktop
Feature: Currency selection

  @smoke @full @BKT_894
  Scenario: Customer changes currency
    When I visit the Arrow Home Page
    And I can see that the currency is set to USD by default
    When I change the currency to "AUD"
    Then the currency should display "AUD"


  @full @BKT_894 @qa_only
  Scenario: Customer's currency selection is remembered
    When I visit the Arrow Home Page
    And I change the currency to "AUD"
    When I return to the site later
    Then the currency should display "AUD"
