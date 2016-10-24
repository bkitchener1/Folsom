@api_dependent
Feature: PartsCategoryLandingPage
  As a user, I want to see a primary part category landing page so I can explore the parts within a category

  @ARROW_624 @full @smoke @mobile @desktop
  Scenario: User wants to view Primary Part Category Landing page
    When I visit a Part Category Landing Page
    Then I can see a Part Title
#    And I can see a Part Description
 #   And I can see a Sub Heading
#    And I can see a Product Selector

  @ARROW_624  @full @desktop
  Scenario: Larger Breakpoints display the Datasheets and Parts counts to the right of page
    Given I visit a Part Category Landing Page
    Then I can see the Part Category Stats on the Right
    And I CANNOT see the Part Category Stats below the main content

  @ARROW_624 @full @phablet
  Scenario: Smaller Breakpoints display the Datasheets and Parts counts to the right of page
    Given I visit a Part Category Landing Page
    Then I can see the Part Category Stats below the main content

  @ARROW_988 @full @desktop
  Scenario: User can see product count on Sub Product Category page
    Given I visit a Part Category Landing Page
    When I click a Sub Product Category from Product Category Page
    Then I am directed to a Sub Part Category Page
    And I can see a Counter Slide Module
    And I can see a Product Counter with valid number

  @ARROW_1011 @full
  Scenario: User can see product count on Product Line page
    Given I visit a Part Category Landing Page
    When I click a Product Line link from Product Category Page
    Then I am directed to a Sub Part Category Page
    And I can see a Counter Slide Module
    And I can see a Product Counter with valid number
