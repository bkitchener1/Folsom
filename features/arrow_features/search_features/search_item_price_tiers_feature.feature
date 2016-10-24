@desktop
@api_dependent
Feature: SearchItemPriceTiers
  As a user I want to see correct price tiers displayed on the part search results page

  @ARROW_762 @BKT_425 @full @smoke
  Scenario: User can see Price Tiers and a More Link
    Given I have searched the Arrow site for a Part with Price Tiers
    Then I can see Price Tiers visible on the Search Result Item
    And I can see a More Pricing link on the Search Item
    And The Part has the correct Parts Page Url

  @ARROW_881 @full @smoke
  Scenario: The relevant price tier should be highlighted when a User enters an increment Quantity
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    And I can see the Increment amount for the Search Item
    When I Enter the Quantity for the Search Item
    Then The relevant Price Tier is highlighted
