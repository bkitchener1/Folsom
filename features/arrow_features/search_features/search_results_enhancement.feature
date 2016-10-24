@desktop
Feature: Search Results Filter Enhancement
  So I can select from a range of products
  As a customer
  I want to be able to filter search results appropriately

  @smoke @full @BKT_721 @skip @requirement_changed?
  Scenario: Customer uses non-numeric criterion filtering with enhancement
    When I enable the Feature Flag  'ProductSearchDisplayUnsupportedFiltersAsCheckboxes'
    And I search for a product line with a non-numeric filter
    Then I can filter appropriately for a non-numerical value

  @smoke @full @BKT_721 @skip @requirement_changed?
  Scenario: Customer uses non-numeric criterion filtering without enhancement
    When I disable the Feature Flag  'ProductSearchDisplayUnsupportedFiltersAsCheckboxes'
    And I search for a product line with a non-numeric filter
    Then I can filter for a non-numerical value using the original method

  @smoke @full @BKT_645
  Scenario: Customer uses arbitrary value filtering
    And I search for a wide range of products
    Then I can filter for values in a checkbox format