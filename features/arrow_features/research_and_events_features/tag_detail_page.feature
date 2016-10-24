Feature: TagDetailPage

  @ARROW_1651 @full @desktop
  Scenario: User can link to the Tag page from any Tag displayed
    Given I visit the Research and Events Landing Page
    Then the Research and Events page should have tags visibles
    Then all tags should have correct urls

  @ARROW_1409 @full @desktop
  Scenario: Users can see Similar Tags when we viewing the Tag Detail Page
    Given I visit the Research and Events Landing Page
    And I click the first tag
    Then I am directed to the Tag's Detail Page
    Then I can see Similar Tags