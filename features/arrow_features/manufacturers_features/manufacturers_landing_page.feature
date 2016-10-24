@cms_dependent
Feature: ManufacturersLandingPage
  As a user I want to see the manufacturers landing page so I can discover arrow's manufacturers


  @ARROW_566 @full @mobile @tablet @desktop @wide
  Scenario: User wants to view the copy on the top of the manufacturer landing page in different sizes
    Given I visit the Manufacturers Landing Page
    Then I see the Manufacturer page title
    And I see the first paragraph under the page title
    And I see the page description under the first paragraph in a smaller font than the first paragraph


  @ARROW_227 @ARROW_724 @full @smoke @desktop
  Scenario: User can see the Browse the manufacturers Section
    Given I visit the Manufacturers Landing Page
    Then I can see the Browse Manufacturer A-Z section

  @ARROW_724 @BKT_396 @full @smoke @desktop
  Scenario: User can see that Show All is the selected Tab by default
    Given I visit the Manufacturers Landing Page
    And The Selected Tab is "showall"
    And The Results heading is "New"
    And I can see more than "1" Section Amongst the Manufacturer Results
    And The default view type is "list"

  @ARROW_227 @full @smoke @desktop
  Scenario: User can filter Manufacturers
    Given I visit the Manufacturers Landing Page
    When I select tab "M"
    Then The Results heading is "M"
    And I can see all the Manufacturers starting with "M"

  @ARROW_227 @full @desktop
  Scenario Outline: User can Browse the Manufacturers list
    Given I visit the Manufacturers Landing Page
    And I select tab "New"
    When I select tab "<url_param>"
    And The Selected Tab is "<url_param>"
    And The URL tab parameter should be "<url_param>"

    Examples:
      | url_param |
      | P         |
      | 09     |
      | showall   |
      | Linecards |

  @ARROW_827 @full @desktop
    Scenario: User can see filter by Linecards on different screen sizes
    Given I visit the Manufacturers Landing Page
    When I select tab "Linecards"
    Then The Linecards section is visible
    And I can see Linecard items
