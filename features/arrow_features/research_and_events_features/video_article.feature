Feature: VideoArticle
  @smoke @full @smoke @mobile @desktop
  Scenario: User wants to see the following Title, Full Date, Tags, Share icon and Add to content icon
    And I visit the Video Article Page
    Then I will see the Title
    And I will see the Full date
    And I will see the Tags
    And I will see the Add to content icon

  @full @nonphantom @mobile @desktop @wide @phablet @tablet @max
  Scenario: User wants to see the Video present on page
    And I visit the Video Article Page
    And I can view the Video module within the body content
