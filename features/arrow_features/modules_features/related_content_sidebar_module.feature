@cms_dependent
Feature: RelatedContentSidebarModule

  @ARROW_1997 @full @smoke @mobile @desktop
  Scenario: Users can see the Latest News module with 3 items on a News Article on all Screen Sizes
    Given I visit a News Article on the Arrow site
    Then I can see the Related Content Sidebar
    Then I find the Masonry Section
    And The Related Content Sidebar has "3" items


  @ARROW_1997 @full @tablet @phablet @wide
  Scenario: Users can see the Latest News module with 3 items on a News Article on all Screen Sizes
    Given I visit a News Article on the Arrow site
    Then I can see the Related Content Sidebar
    Then I find the Masonry Section
    And The Related Content Sidebar has items

  @ARROW_1997 @full @desktop
  Scenario: Latest Content items are NOT Videos when a viewing a News Article
    Given I visit a News Article on the Arrow site
    And Each Related Content item does NOT have a Play Video icon

  @ARROW_1997 @full @smoke @desktop
  Scenario: Users can see the Latest News module with 3 items on a Video Article
    Given I visit the Video Article Page
    Then I find the Masonry Section
    And The Related Content Sidebar has "3" items

  @ARROW_1997 @full @desktop
  Scenario: Latest Content items are Videos when a  viewing a Video Article
    Given I visit the Video Article Page
    And Each Related Content item has a Play Video icon