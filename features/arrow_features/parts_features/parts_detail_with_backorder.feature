 @api_dependent
  Feature: PartsDetailBackOrder
  As a user I want to see any Back Order buying options available to me for a particular product

  @ARROW_776 @full @smoke @slow @desktop
  Scenario: User can see a Back Order button on the Parts Detail Page
    And I visit the Part Detail Page for a back ordered item
    And the Part Detail page contains a Back Order link to a 3rd party site
    And I can see the Stock Status Text
    And I CANNOT see the Get By Text
    And I CANNOT see the Contact information
