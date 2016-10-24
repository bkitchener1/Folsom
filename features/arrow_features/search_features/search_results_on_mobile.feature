@api_dependent
Feature: SearchResultsOnMobile

  Scenario: Mobile Users cannot see the Onward Date on the Search Results Page

  @ARROW_1265 @full @mobile @smoke
  Scenario: Mobile Users cannot see the Price Tiers on the Parametric Search Results Page
    And I have searched the Arrow site for a Part with Multiple Price Tiers
    Then The Search Item does NOT have any Price Tiers visible

  @ARROW_1265 @full @mobile @smoke
  Scenario: Mobile users cannot see the extra Scrollable columns on the Parametric Search Results Page
    And I have searched the Arrow site for a Part with Multiple Price Tiers
    Then The Search Results columns are not NOT scrollable

  @ARROW_1265 @full @phablet
  Scenario: Phab users cannot see the extra Scrollable columns on the Parametric Search Results Page
    And I have searched the Arrow site for a Part with Multiple Price Tiers
    Then The Search Results columns are not NOT scrollable

  @ARROW_1343 @full @mobile @smoke
  Scenario: Mobile users can see key info on the Reference Design Search Results Page
    And I have searched the Arrow site for Reference Design "diodes"
    And I find the first Reference Design Search Item
    Then I can see the Description for the Reference Design Search Item
    And I can see the Manufacturer Name for the Reference Design Search Item
    And I can see the For Application info for the Reference Design Search Item
    And I can see the For End Products info for the Reference Design Search Item

  @ARROW_1343 @full @mobile
  Scenario: Mobile users can Share and Add to Project an item on the Reference Design Search Results Page
    And I have searched the Arrow site for Reference Design "diodes"
    And I find the first Reference Design Search Item
#    Then I can see a Share Button for the Reference Design Search Item
    And I can see an Add To Project Button for the Reference Design Search Item

  @ARROW_1130 @full @mobile
  Scenario: Mobile Users CANNOT expand to see related Parts for Datasheets
    And I have searched the Arrow site for Datasheet "diodes"
    And I find the first Datasheet Item with more than 1 Related Part
    Then I CANNOT see a View Products link for the Datasheet Search Item