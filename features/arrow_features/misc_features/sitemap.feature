Feature: Sitemap

  @ARROW_2283 @smoke @full @desktop
  Scenario: Users can see an Arrow.com sitemap page
    Given I visit the Sitemap Page
    Then I can see a Sitemap Page Title
    And I can see at least "1" h2 Link
    And I can see at least "1" h3 Link


  @ARROW_2282 @smoke @full @desktop
  Scenario: Users can see a product Category Sitemap page
    Given I visit the Product Category Sitemap Page
    Then I can see a Sitemap Page Title
    And I can see at least "1" h2 Link
    And I can see at least "1" Product Link in the First Sub Category Section