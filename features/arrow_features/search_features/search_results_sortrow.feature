Feature: Search Results sort row

  @full @desktop @tablet
  Scenario: User can sort Part number by clicking the column
    Given I have searched the Arrow site for Product "bav"
    Then The "Part NO" column should be displayed in it's default sorting
    When I click the "Part NO" column on the search results
    Then The "Part NO" column should be displayed as Ascending
    When I click the "Part NO" column on the search results
    Then The "Part NO" column should be displayed as Descending
    When I click the "Part NO" column on the search results
    Then The "Part NO" column should be displayed in it's default sorting

  @full @desktop @tablet
  Scenario: User can sort Price by clicking the column
    Given I have searched the Arrow site for Product "bav"
    Then The "Price" column should be displayed in it's default sorting
    When I click the "Price" column on the search results
    Then The "Price" column should be displayed as Ascending
    When I click the "Price" column on the search results
    Then The "Price" column should be displayed as Descending
    When I click the "Price" column on the search results
    Then The "Price" column should be displayed in it's default sorting

  @full @desktop @tablet
  Scenario: User can sort Stock by clicking the column
    Given I have searched the Arrow site for Product "bav"
    Then The "Stock" column should be displayed in it's default sorting
    When I click the "Stock" column on the search results
    Then The "Stock" column should be displayed as Ascending
    When I click the "Stock" column on the search results
    Then The "Stock" column should be displayed as Descending
    When I click the "Stock" column on the search results
    Then The "Stock" column should be displayed in it's default sorting

  @full @desktop @tablet
  Scenario: User can sort Manufacturer by clicking the column
    Given I have searched the Arrow site for Product "bav"
    Then The "Manufacturer" column should be displayed in it's default sorting
    When I click the "Manufacturer" column on the search results
    Then The "Manufacturer" column should be displayed as Ascending
    When I click the "Manufacturer" column on the search results
    Then The "Manufacturer" column should be displayed as Descending
    When I click the "Manufacturer" column on the search results
    Then The "Manufacturer" column should be displayed in it's default sorting

  @full @desktop @tablet
  Scenario: User can sort Type by clicking the column
    Given I have searched the Arrow site for Product "bav"
    Then The "Type" column should be displayed in it's default sorting
    When I click the "Type" column on the search results
    Then The "Stock" column should be displayed as Ascending
    When I click the "Type" column on the search results
    Then The "Type" column should be displayed as Descending
    When I click the "Type" column on the search results
    Then The "Type" column should be displayed in it's default sorting
