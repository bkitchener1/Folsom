Feature: MegaMenu
  As A Desktop user
  I can see a Mega Menu offering me links to channel specific content

  @full @smoke @ARROW_91 @ARROW_89 @ARROW_84 @ARROW_2329 @ARROW_1899 @ARROW_91 @mobile @tablet @phablet
  Scenario: Mobile Users CANNOT see the Mega Menu
    And I visit the Arrow Home Page
    When I hover over the Nav item Products
    Then I cannot see the MegaMenu


  @full @smoke @ARROW_91 @ARROW_89 @ARROW_84 @ARROW_2329 @ARROW_1899 @ARROW_91 @ARROW_1899 @desktop
  Scenario Outline: Desktop Users can see a Mega Menu for each Channel of the Arrow.com site
    Given I visit the Arrow Home Page
    Then The Mega Menu for "<channel_url>" has the Section Headers "<sections_headers>"

    Examples:
      | channel_url       | sections_headers                                                |
      | datasheets          | New, Datasheet Categories, Recently Viewed                      |
      | reference-designs   | New, Categories by Application, by End Product, Recently Viewed |
      | products            | New, Product Categories, Manufacturers                          |
      | research-and-events | Latest, Articles, Events, Videos                                |
      | design-center       | Tools, My Projects                                              |


  @full @ARROW_91 @ARROW_89 @ARROW_84 @ARROW_2329 @ARROW_1899 @ARROW_91 @ARROW_1899 @desktop
  Scenario Outline: The Mega Menu has Channel specific links
    Given I visit the Arrow Home Page
    Then The Mega Menu for "<channel_url>" has the link "<link>"

    Examples:
      | channel_url         | link                                                |
      | datasheets          | /datasheets                                        |
      | reference-designs   | /reference-designs                                 |
      | research-and-events | /research-and-events/                               |
      | products            | /products/manufacturers                             |
      | design-center       | /design-center                                      |

  @ARROW_1916 @full
  Scenario: Users can see their Recently Viewed Reference Designs in the Mega Menu
    And I visit a Reference Design Detail Page
    When I visit the Arrow Home Page
    And I hover over the Nav Item "reference-designs"
    Then I can see the Recently Viewed Reference Design Item in the Mega Menu

  @ARROW_98 @full @desktop
  Scenario: Users can see their Recently Viewed Datasheet in the Mega Menu
    Given I visit the Datasheets Detail page
    And I have waited "6" seconds
    When I visit the Arrow Home Page
    And I hover over the Nav Item "datasheets"
    Then I can see the Recently Viewed Datasheet Item in the Mega Menu
