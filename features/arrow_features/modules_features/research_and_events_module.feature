Feature: ResearchAndEventsFeature
  @ARROW_1819 @full @desktop
  Scenario: User can see Research and Events module on Manufacturer Detail page with no content
    Given I visit the Manufacturers Detail Page
    Then I can see the Research And Events module
    And the Research and Events module should have the correct title
    And the Research and Events module should have a video visible
    And the Research and Events module should have an event item
    And the Research and Events module should have a news item
    And each tile in the Research and Events module should load correctly

  @ARROW_1003 @full @desktop
  Scenario: User can see Research and Events module on Product Category page
    Given I visit a Part Category Landing Page
    Then I can see the Research And Events module
    And the Research and Events module should have the correct title
    And the Research and Events module should have at least "1" item
    And each tile in the Research and Events module should load correctly

  @ARROW_1003 @full @desktop
  Scenario: User can see Research and Events module on Product Line page
    And I visit a Part Category Landing Page
    When I click a Product Line link from Product Category Page
    Then I can see the Research And Events module
    And the Research and Events module should have at least "1" item
    And the Research and Events module should have the correct title
    And each tile in the Research and Events module should load correctly

