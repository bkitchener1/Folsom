 @api_dependent
  Feature: PartBackOrderForm
  As a user I want to have a Back Order Form available when an item is not available for purchase and not discontinued

  @ARROW_776 @full @smoke @slow @desktop
  Scenario: User can see a Back Order button on the Parts Detail Page
    And I visit the Part Detail Page for a back ordered item
    And the Part Detail page contains a Back Order link to a 3rd party site
    When I click the Back Order button
    Then I can see the BAV99_D87Z Back Order Form appear
    And I verify content fields





