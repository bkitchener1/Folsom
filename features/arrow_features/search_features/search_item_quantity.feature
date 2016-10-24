@api_dependent
@desktop
Feature: SearchItemQuantity
  As a user, when I enter a quantity on the search results page, I want the total price to be dynamically calculated

  @ARROW_538 @full @smoke
  Scenario: The Initial page load shows results without price totals shown
    Given I have searched the Arrow site for Product "ba"
    Then The Total Price does NOT display

  @ARROW_538 @ARROW_837 @full @smoke
  Scenario: User enters the Qty from the first price band the Total price displays with the relevant Price Band
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    And I can see the Increment amount for the Search Item
    When I Enter the Quantity for the Search Item
    Then The Total Price displays for the Search Item
    And The Search Item has the Total Price with the relevant Price

  @ARROW_282 @full
  Scenario: User tries to purchase LESS than the Minimum order Quantity of a specific product
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    And I can see the Increment amount for the Search Item
    When I Enter a Quantity that is less than the Minimum for the Search Item
    And I click to Buy for the Search Item
    Then The Quantity Confirmation Pop up displays

  @ARROW_282 @full
  Scenario: User tries to purchase MORE than the Maximum order Quantity of a specific product
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    And I can see the Increment amount for the Search Item
    When I Enter a Quantity that is more than the Maximum for the Search Item
    And I click to Buy for the Search Item
    Then The Quantity Confirmation Pop up displays

  @ARROW_282 @full
  Scenario: User tries to purchase a product with an invalid value in the quantity field
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    When I Enter a Quantity of "abcd" for the Search Item
    And I click to Buy for the Search Item
    Then The Quantity Confirmation Pop up displays

  @ARROW_282 @full
  Scenario: User clicks Buy without entering a Quantity
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    And I click to Buy for the Search Item
    Then The Quantity Confirmation Pop up displays

  @ARROW_769 @full
  Scenario: User can see the Minimum quantity
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    Then I can see the Minimum Quantity in the Search Item's Quantity field