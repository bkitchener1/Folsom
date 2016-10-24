Feature: RelatedResearchAndEventsModule

  @ARROW_564 @full @smoke @desktop
  Scenario: User can see the Related Videos Module when viewing a Video Article
    Given I visit the Video Article Page
    Then I can see the Related Content Sidebar
    And The Related Content Sidebar has "3" items

  @ARROW_329 @full @smoke @desktop
  Scenario: User can see the Related Articles Module when viewing a News Article
    Given I visit a News Article on the Arrow site
    Then I can see the Related Content Sidebar
    And The Related Content Sidebar has "3" items

  @ARROW_564 @full @smoke @desktop
  Scenario: Each Article displays with a Title, Tags, and Creation Date
    Given I visit the Video Article Page
    Then Each Related Article displays with a Title
    And Each Related Article displays with Tags
    And Each Related Article displays with Creation Date

  @ARROW_564 @full @desktop
  Scenario: User can toggle through the Carousel
    Given I visit the Video Article Page
    Then the Related Content Module has a disabled Back button
    And Article "1" is present on the Related Content Module
    And The first "3" Articles are visible on the Related Content Module
    When I click on the Related Content Module's Next Button
    Then The Related Content Module's Previous button is enabled
    And Article "1" is no longer present on the Related Content Module
    When I click on the Related Content Module's Previous Button
    Then The Related Content Module's Previous button is disabled
    And The first "3" Articles are visible on the Related Content Module


  @ARROW_564 @full @mobile
  Scenario: Mobile users can see 1 Related Video when viewing a Video Article
    Given I visit the Video Article Page
    Then The first "1" Articles are visible on the Related Content Module
    And The Related Content Module shows "1" content slides

  @ARROW_329 @full @mobile
  Scenario: Mobile users can see 1 Related Video when viewing a News Article
    Given I visit the Video Article Page
    Then The first "1" Articles are visible on the Related Content Module
    And The Related Content Module shows "1" content slides
