@desktop
Feature: Improvements to the Category/Product Line filter selection

  @BKT_404 @full @smoke
  Scenario: Customer can quickly step back up to product list after selecting category
    When I search the Arrow site for Product "BAV99"
    And I filter by category
    Then I can link back to all categories

  @BKT_404 @full @smoke
  Scenario: Customer can quickly step back up to product list after selecting subcategory
    When I search the Arrow site for Product "BAV99"
    And I filter by category
    And I filter by subcategory
    Then I can link back to the supercategory
