Feature:  HeaderMinimised
  As a user I want to see the header in a minimised state when I scroll down so I can always navigate to the other sections of the site [desktop only]


  @ARROW_319 @full @smoke @desktop
  Scenario: A user wants to see the header minimised when they scroll down
    Given I have searched the Arrow site for Product "BAV"
    And I scroll down to the bottom of the page
    Then The Header Menu changes to a minimised state

  @ARROW_319 @full @mobile
  Scenario: On smaller screen sizes the minimise Header is NOT present
    Given I have searched the Arrow site for Product "BAV"
    And I scroll down to the bottom of the page
    Then The Header is NOT in a minimised state

  @ARROW_319 @full @smoke @desktop
  Scenario: A user wants to see the header in the default state as they scroll back up
    Given I have searched the Arrow site for Product "BAV"
    And I scroll down to the bottom of the page
    When I scroll back to the top of the page
    Then The Header is NOT in a minimised state

  @ARROW_319 @full @desktop
  Scenario: The minimised Header hides some elements
    Given I have searched the Arrow site for Product "BAV"
    And I scroll down to the bottom of the page
    Then The Divisions Button is NOT visible
    And The Arrow Phone number is NOT visible
    And The Live Support is NOT visible
    And The Search input is NOT visible
