Feature: Spinner Persistence

  @desktop @smoke @full
  Scenario: Spinner does not persist after update
    When I visit the Reference Design Landing Page
    And I am Browsing By End Product
    And I filter product search results
    Then I can see the results after the wait spinner has closed