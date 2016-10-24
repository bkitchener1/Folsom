@api_dependent
Feature: SearchSubmit
  As a user I want to search using a keyword so I can view search results

  @ARROW_280 @full @smoke @desktop
  Scenario: User can enter a query and submit a Parametric Search on Desktop
    Given I visit the Arrow Home Page
    When I Submit a search on the Desktop version of the Arrow site for "ba"
    Then I am directed to the Products Search Results Page
    And My search term displays in the Search field

  @ARROW_2004 @full @smoke @mobile
  Scenario: User can enter a query and submit a Parametric Search on Mobile
    Given I visit the Arrow Home Page
    When I Submit a search on the Mobile version of the Arrow site for "ba"
    Then I am directed to the Products Search Results Page
    When I click on the Mobile search icon
    And My search term displays in the Search field