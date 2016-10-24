@api_dependent @desktop
Feature: ProductDetailPriceQuantity
  As a user I want the Price indicator to update dynamically when I add a valid quantity to an "Add to Cart" buying option

  Background:
    Given I visit a Part Detail with Multiple Cart Options
    And I see the first buying option

  @ARROW_783 @full @smoke
  Scenario: User can see a total price calculation after adding something to there Cart from the Parts Detail Page
    When I Enter the Minimum Quantity for the Buy Option
    And The Buy Option has the Total Price with the relevant Price

  @ARROW_783 @full
  Scenario: User tries to purchase LESS than the Minimum order Quantity of a specific product on the PDP
    When I Enter a Quantity that is less than the Minimum of the Buy option
    And I click to Buy for the Buy Option
    Then The Quantity Confirmation Pop up displays

  @ARROW_783 @full
  Scenario: User tries to purchase MORE than the Maximum order Quantity of a specific product on the PDP
    When I Enter a Quantity that is more than the Maximum of the Buy Option
    And I click to Buy for the Buy Option
    Then The Quantity Confirmation Pop up displays

  @ARROW_783 @full
  Scenario: User tries to purchase a product with an invalid value in the quantity field on the PDP
    When I Enter a Quantity of "abcd" for the Buy Option
    And I click to Buy for the Buy Option
    Then The Quantity Confirmation Pop up displays

  @ARROW_783 @full
  Scenario: User clicks Buy without entering a Quantity on the PDP
    And I click to Buy for the Buy Option
    Then The Quantity Confirmation Pop up displays