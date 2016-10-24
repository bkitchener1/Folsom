Feature: Search Results Filters Apply Button

  @desktop @smoke @full @ARW_888
  Scenario: Filters update on selection without clicking on Apply - Horizontal Filters
    Given  I enable the Feature Flag 'SearchApplyFiltersDesktop'
    When I search for a wide range of products
    And I am filtering using the horizontal filters
    When I choose to automatically apply the filters
    Then I do not need to take action to apply the horizontal layout filters

  @desktop @smoke @full @ARW_888
  Scenario: Search results update on clicking Apply
    Given  I enable the Feature Flag 'SearchApplyFiltersDesktop'
    When I search for a wide range of products
    Then I can apply the search filters

  @desktop @smoke @full @ARW_888
  Scenario: 'Clear All' filters
    Given  I enable the Feature Flag 'SearchApplyFiltersDesktop'
    And I search for a wide range of products
    And I filter the results
    Then I can clear all the filters

  @ARROW_626, @ARW_888 @ARROW_561 @BKT_630 @full @smoke @desktop
  Scenario:Desktop Users can see a Cancel and Apply Button in the Search Filters
    Given I enable the Feature Flag 'SearchApplyFiltersDesktop'
    Given I have searched the Arrow site for Product "diodes"
    Then I CANNOT apply the search filters

