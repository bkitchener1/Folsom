@desktop
Feature: ProductsLandingPageFeature

  @ARROW_931 @smoke @desktop
  Scenario: Tabbed content filter module is visible on the Products Landing Page
    Given I visit the Products Landing Page
    Then I see Tabbed Content Filter module
    And The First link is visible and is selected

  @ARROW_931 @full @tablet @desktop
  Scenario: User can see all the Tabbed Content on the Products Landing Page Links while on Desktop
    Given I visit the Products Landing Page
    Then All the Tabbed Content Links are visible

  @ARROW_975 @full @desktop
  Scenario: User can click a Product Category and can see further details
    Given I visit the Products Landing Page
    And I click the All Products Tab
    When I click on Product amongst the Product Categories
    Then The Product Category expands
    And I can see a button that directs to the Product Detail Page

  @ARROW_975 @full @desktop
  Scenario: The Product Category drawer shows sub-category Products
    Given I visit the Products Landing Page
    And I click the All Products Tab
    When I click on Product amongst the Product Categories
    Then The Product Category expands
    And There are Sub-Products listed
    And Each Sub-Category link is a child of the Parent Product Category

  @ARROW_1857 @ARROW_959 @full @smoke @ARROW_2807 @desktop
  Scenario: User sees new product tab with Product Content Grid module on Product Landing Page
    Given I visit the Products Landing Page
    Then I can see 'NEW PRODUCTS' tab as active tab
    And I can see 1x1 Product Content Grid
    And I can see 2X1 Product Content Grid
    And I can see 2X2 product content Grid
