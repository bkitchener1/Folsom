@desktop
Feature: ReferenceDesignBrowseByManufacturerFeature

  @ARROW_754 @full @smoke
  Scenario: Customer can see the Browse the Manufacturers from A-Z Section on the Reference Design Landing Page
    Given I visit the Reference Design Landing Page
    And I am Browsing By Manufacturer
    Then I can see the Browse Manufacturer A-Z section
    And The selected Tab is visible
    And I CANNOT see the Applications on the Reference Design Landing Page
    And I CANNOT see the End Products on the Reference Design Landing Page


  @ARROW_695 @full @smoke
  Scenario: User can filter Manufacturers on the Reference Design Landing Page
    Given I visit the Reference Design Landing Page
    And I am Browsing By Manufacturer
    When I select tab "N"
    Then I can see all the Manufacturers images starting with "N"

  @ARROW_695 @full
  Scenario Outline: User can Browse the manufacturers list on the Reference Design Landing Page
#    Not enough data for tests to run reliably
    Given I visit the Reference Design Landing Page
    And I am Browsing By Manufacturer
    When I select tab "<tab_name>"
    And The Selected Tab is "<tab_name>"
    And The URL tab parameter should be "<tab_name>"

    Examples:
      | tab_name  | url_param |
      | B         | O         |
      | O       | 09        |

  @ARROW_695 @full
  Scenario: User cannot see Linecards when they Browse the manufacturers list on the Reference Design Landing Page
    Given I visit the Reference Design Landing Page
    And I am Browsing By Manufacturer
    Then I CANNOT see a tab option to filter by Linecards