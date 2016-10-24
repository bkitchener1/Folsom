@cms_dependent
Feature: ManufacturersDetailPage

  @ARROW_853 @full @smoke @desktop @tablet @max
  Scenario: User can see the Product category selector on the Manufacturers Detail Page
    Given I visit the Manufacturers Detail Page
    When I click on Product amongst the Product Categories
    Then The Product Category expands
    And There are Sub-Products listed
    And Each Sub-Category link is a child of the Parent Product Category
    And I can see the product category title
    And I can see the product selector button
    And I can see the product counter

  @ARROW_854 @full @mobile
  Scenario: User view the Product Category on Manufacturer Detail page on Mobile
    Given I visit the Manufacturers Detail Page
    When I click on Product amongst the Product Categories
    Then I can see product category overlay
    And There are Sub-Products listed in overlay
    And I can see the product category title in overlay
    And I can see the product selector button in overlay
    And I can see the product counter in overlay
    When I close the overlay
    Then I cannot see product category overlay

  @ARROW_1740 @full @desktop
  Scenario: User clicks on Product Selector button
    Given I visit the Manufacturers Detail Page
    When I click on Product amongst the Product Categories
    Then The Product Category expands
    When I click an Product Category Product Selector button
    Then I am directed to the Products Search Results Page

  @ARROW_1077 @full @tablet @desktop @wide @mobile @phablet
  Scenario: Product Category on Manufacturer Detail page are sorted on the basis of product count
    Given I visit the Manufacturers Detail Page
    Then I can see product category listed on the basis of product count

