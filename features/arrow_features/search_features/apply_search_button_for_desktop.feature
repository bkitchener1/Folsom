Feature: Apply Search Button for mobile


  @ARROW_626 @ARROW_561 @BKT_630 @full @smoke @tablet
  Scenario: Mobile Users can see a Cancel and Apply Button in the Search Filters
    And I have searched the Arrow site for Product "diodes"
    And I click on the Search Filters Button
    Then I can see a Cancel Button in the Search Filters
    And I can see an Apply Button in the Search Filters



