Feature: EventDetailFeature

  @ARROW_1312 @ARROW_1800 @full @smoke @desktop
  Scenario: User can see event detail page in main resolution profiles
    Given I visit the Event Detail Page
    Then I can see the event title
    And I can see 'add to project' button

  @phablet @tablet @wide @mobile @full
  Scenario: User can see event detail page in minor resolution profiles
    Given I visit the Event Detail Page
    Then I can see the event title
    And I can see 'add to project' button
    And I can see event article
    And I can see Event Tags

