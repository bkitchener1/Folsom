@desktop
Feature: SearchItemBuyingButtons

  @ARROW_836 @full @smoke
  Scenario: User cannot see the Buying buttons for items that are not catered for
    Given I have searched the Arrow site for a Part with a Quote option
    And The Search Item has a Quote Button
    And It contains a Quote link to a 3rd party site

  @ARROW_541 @full @smoke
  Scenario: The Back Order button links to a 3rd party site
    Given I have searched the Arrow site for something out of stock
    Then The Back Order button displays
    And It contains a Back Order link to a 3rd party site

  @ARROW_1144 @full @smoke
  Scenario: The Ecliptek Purchase button displays for Ecliptek Products in Search Results
    Given I have searched the Arrow site for an Ecliptek Part
    Then The Search Item has an Ecliptek Buy button
    And It contains a Ecliptek link to a 3rd party site
