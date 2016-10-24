
Feature: TypeAhead
  As an engineer I want to see the available product categories in the product Category panel before I start typing so that I can explore product if I don't know what I'm searching for

  @ARROW_413 @full @desktop
  Scenario: User can see Arrows products by category in the TypeAhead.
    Given I visit the Arrow Home Page
    When I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    Then The Product Category panel is visible

  @ARROW_413 @full @desktop
  Scenario:  The Product Category panel disappears when I click to Close
    Given I visit the Arrow Home Page
    When I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    When I click the Close TypeAhead button
    Then The Type Ahead panel is NOT visible
    And The Product Category panel is NOT visible

  @ARROW_413 @full @desktop
  Scenario: TypeAhead Panel displays a total amount of parts available on the Arrow Site.
    Given I visit the Arrow Home Page
    When I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    Then I can see the Total amount of Parts available on the site.

  @ARROW_413 @full @desktop
  Scenario:  The Product Category panel is replaced with the matching Search results when I type a 3rd character in the Search input
    Given I visit the Arrow Home Page
    When I set focus to the Search input
    Then The Product Category panel is visible
    And I enter a search query of "b"
    Then The Product Category panel is visible
    And I enter a search query of "ba"
    And The Product Category panel is NOT visible

  @ARROW_413 @full @mobile @tablet @phablet
  Scenario: The TypeAhead does NOT display for Mobile Devices
    And I visit the Arrow Home Page
    When I click on the Mobile search icon
    And I set focus to the Search input
    Then The Type Ahead panel is NOT visible
    And  I enter a search query of "ba"
    And The Type Ahead panel is NOT visible

  @ARROW_413 @full @smoke @desktop
  Scenario: The Product Category panel has at least 1 item
    Given I visit the Arrow Home Page
    Given I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    Then There is at least 1 Product category displaying

  @ARROW_413 @full @desktop
  Scenario: Each item in the Product Category panel is a link and has an image, header text and amount of Parts
    Given I visit the Arrow Home Page
    Given I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    Then The Product Category item has a corresponding link, header text, image and an amount of parts

  @ARROW_2542 @full @smoke @desktop @wide
  Scenario: User can see matching results in the Typeahead when they enter 2 characters into the Search Field on Desktops only
    Given I visit the Arrow Home Page
    Given I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    When I enter a search query of "ba"
    Then The Matching Results panel is visible

  @ARROW_2542 @full @smoke @desktop
  Scenario: Users can see up to 5 Matching Results in the Typeahead
    Given I visit the Arrow Home Page
    Given I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    When  I enter a search query of "ba"
    Then I can see up to "5" Matching Results in the Typeahead Search Panel

  @ARROW_2542 @full @desktop
  Scenario: Users can see up to their Search Term in bold in the Matching Results in the Typeahead
    Given I visit the Arrow Home Page
    Given I set focus to the Search input
    And I wait for the Type Ahead Panel to Display
    When  I enter a search query of "ba"
    Then Each Result in the Typeahead Search Panel has the Search Term in Bold

  @ARROW_2542 @full @desktop
  Scenario: The Matching Results in Typeahead are Parametric Search Links
    Given I visit the Arrow Home Page
    Given I set focus to the Search input
    When  I enter a search query of "CRM"
    Then Each Result in the Typeahead Search Panel is a valid Parametric Search link

  @ARROW_2542 @full @smoke @desktop
  Scenario: Users can see search links with their Search Term for All of the types of Arrow Searches
    Given I visit the Arrow Home Page
    When  I start to search for a product
    Then I can select each search category from the typeahead results