Feature: NavigationBar

  As a user
  I want to navigate the main sections of the site
  So I can get to the content

  @desktop @mobile @full
  Scenario Outline: A user can navigate to products
    Given I visit the Arrow Home Page
    When I select a "<channel_name>" item
    Then I will be directed to the relevant page "<channel_name>"

  Examples:
    | channel_name |
    | Products        |
    | Datasheets     |
    | Research and Events |
#TODO: Possible to re-use same Outline for multiple scenarios?

  @ARROW_921 @full @smoke @desktop
  Scenario: User can see the amount of New Products by the Products channel in the Navigation Bar
    Given I visit the Arrow Home Page
    Then The "products" Channel has a count of New Products