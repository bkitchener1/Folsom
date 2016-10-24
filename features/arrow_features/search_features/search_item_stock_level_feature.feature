@api_dependent @desktop
Feature: SearchItemStock
  As a user I want to see a correct stock level displayed on the part search results page

  Background:
    Given I have searched the Arrow site for Product "ba"

  @ARROW_764 @full @smoke
  Scenario: User can see the Stock level for Search Items in Stock
    Then I can see the Stock Level for the Search Item
    And The Stock Level for the Search item is more than zero

  @ARROW_764 @full @smoke @slow
  Scenario: User cannot see the Stock level for Back Order Items
    And I have searched the Arrow site for something out of stock
    Then I CANNOT see the Stock Level for the Search Item
