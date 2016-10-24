@desktop
Feature: PartDetailsFeature
  As a user i want the Part Summary module on the PDP to display real data so I can evaluate the product

  @ARROW_570 @full @smoke
  Scenario: User can see key info on the Product Details Page
    And I visit a Part Detail with Multiple Cart Options
    Then I can see a Manufacturer on the Product Detail Page
    And I can see a Product Category on the Product Detail Page
    And I can see a Description on the Product Detail Page
    And I can see a Add Content on the Product Detail Page
    And I can see the Get By Text

  @api_dependent
  @ARROW_578 @full
  Scenario: Clicking on Reference Design Search Item Envision Button opens Reference Design in Envision
    Given I visit a Part Detail with Envision Link
    Then I can see Design With Envision icon
    And I can see Design with Envision link
    And Envision button links to the product in Envision

  @ARROW_996 @full @smoke
  Scenario: Administrator switches to 'new' format for delivery lead time message
    Given I visit a Part with 'get-by' information
    Then I can see the new format for the expected delivery time