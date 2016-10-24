@cms_dependent @desktop
Feature: SearchResultsSort
  As a user I want to sort the search results on the product page so I can get more relevant items at the top

  @ARROW_1347 @full @smoke @skip @defect
  Scenario: I can see Sort Options on the Reference Design Search Results Page
    Given I have searched the Arrow site for Reference Design "diodes"
    Then I can see a Sort Select drop-down
    And There are Reference Design Search Sort Options

  @ARROW_1347 @full @smoke @skip @defect
  Scenario: The default Reference Design Search Sort option is by Relevance
    Given I have searched the Arrow site for Reference Design "diodes"
    Then The selected Sort Option value is "Relevance"

  @ARROW_1347 @full
  Scenario: I can sort the Reference Design results by different Types
    Given I have searched the Arrow site for Reference Design "diodes"
    Then I can change the Sort Option
      | sort_option |
      | DateAsc     |
      | DateDesc    |
      | MfrAsc      |
      | MfrDesc     |
      | AppAsc      |
      | AppDesc     |

  @ARROW_1640 @full @smoke @skip @defect
  Scenario: I can see Sort Options on the Content Search Results Page
    Given I have searched the Arrow site for Research and Events "test"
    Then I can see a Sort Select drop-down
    And There are Research and Events Search Sort Options

  @ARROW_1640 @full @smoke @skip @defect
  Scenario: The default Content Search Sort option is by Relevance
    Given I have searched the Arrow site for Research and Events "test"
    Then The selected Sort Option value is "Relevance"


  @BKT-689 @full @smoke
  Scenario: Users can Click on a Standard Search Results Column to Sort the Results
    Given I enable the Feature Flag  'ProductSearchSortableColumnHeadings'
    Given I have searched the Arrow site for Product "BAV"
    When I click on the Search Column "calculatedPrice"
    Then The URL Sort By parameter should change to include "calculatedPrice&sortDirection=asc"

  @BKT-689 @full
  Scenario: Users can Click on an additional Search Results Column to Sort the Results
    Given I enable the Feature Flag  'ProductSearchSortableColumnHeadings'
    Given I Search for Product Category 'Batteries'
    When I click on the Search Column "Chemistry"
    Then The URL Sort By parameter should change to include "Chemistry&sortDirection=asc"
