@desktop
Feature: SearchResultsLinking
  I can link to various Arrow Pages from the Search Results Page

  @ARROW_434 @full @smoke
  Scenario: User clicks on Part in Search Results
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    When I click on the Title of the Search Item
    Then I am directed to the Part Page
    And The Part Page Title matches the Search Result Item I clicked on
    And The Part Page Manufacturer matches the Search Result Item I clicked on

  @ARROW_645 @full
  Scenario: User can link to Parts page from the Mini Cart
    Given I have an item in my cart
    When I click on Cart in the Header to Expand it
    And I click on item "1" in the Cart
    Then I am directed to the Part Page

  @ARROW_1343 @full @smoke
  Scenario: Clicking on the Reference Design Search Item Title links to the Reference Design Detail page
    Given I have searched the Arrow site for Reference Design "LT1568CGN"
    And I find the first Reference Design Search Item
    When I click on the Reference Design Search Item's Title
    And The Reference Design Detail page has the correct URL structure

  @ARROW_1994 @full
  Scenario: User can go directly to the Manufacturer Detail Page from Parts Search Results
    Given I have searched the Arrow site for a Part with Price Tiers
    When I click on the Manufacturer Name of the Search Item
    Then I am directed to the Manufacturer Detail Page

  @ARROW_1996 @full
    Scenario: User can go directly to the Manufacturer Detail page by clicking on the Released By column when Searching For Reference Designs
    Given I have searched the Arrow site for Reference Design "test"
    And I find the first Reference Design Search Item
    When I click on the Released By Manufacturer Name of the Search Item
    Then I am directed to the Manufacturer Detail Page