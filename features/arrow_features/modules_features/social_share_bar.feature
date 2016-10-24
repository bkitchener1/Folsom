Feature: Social Share Bar
  As a User I can see a Social Share bar at the bottom of an Article

  @ARW-358 @smoke @full
  Scenario: Users can see a Social Share Bar at the bottom of the Article body
    Given I visit a News Article on the Arrow site
    Then I can see the Social Share Bar
    And I can use the Social Share bar to search to "4" Platforms