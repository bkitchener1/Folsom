@api_dependent @desktop
Feature: ShoppingCart
  As a user I want to add products to my cart directly from the search so I can save time

  @cart_smoke @ARROW_157 @ARROW_539 @ARROW_554 @full
  Scenario: The Shopping Cart in Header updates when an item is added
    Given I have searched the Arrow site for a Part with a minimum quantity
    When I Buy the Minimum amount of the Search Item
    Then My Cart should have "1" item in it
    And The Search Item displays with a Buy More Button

  @cart_smoke @ARROW_830 @ARROW_894 @ARROW_155 @ARROW_888 @full
  Scenario: The Correct Search Item gets added to the Shopping Cart
    Given I have searched the Arrow site for Product "BAV99"
    And I can see the Increment amount for the Search Item
    And I Enter the Quantity for the Search Item
    And The Total Price displays for the Search Item
    And The Search Item has the Total Price with the relevant Price
    And I click to Buy for the Search Item
    And My Cart should have "1" item in it
    When I click on Cart in the Header to Expand it
    Then I can see the matching Item I added to Cart
    And The Cart shows a Summary of my Cart contents
    And The Cart Total is correct

  @ARROW_540 @full @cart_smoke
  Scenario: The Shopping Cart links to the Arrow Cart site
    Given I visit the Arrow Home Page
    And I click the header cart icon
    Then The Shopping Cart url is correct

