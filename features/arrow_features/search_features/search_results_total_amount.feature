@desktop @mobile @tablet @full @smoke @qa_only
  # marking qa_only after consultation with team to exclude this from release support testing

Feature: SearchResultsTotalAmount
  As a user I want to see the total search results for my search term and applied filters

  Scenario: Customer can see the number of Product Search Results displayed the feature flag enabled
    Given I 'enable' the Feature Flag  'ProductSearchShowTotalResultCount'
    When I visit the Arrow Home Page
    And I search the Arrow site for Product "ba"
    Then I can see the number of Search Results displayed

  Scenario: Customer can see the number of Product Search Results displayed the feature flag enabled
    Given I enable the Feature Flag  'ProductSearchShowTotalResultCount'
    When I have searched the Arrow site for Product "ba"
    Then I can see the number of Search Results displayed

  Scenario: Customer cannot see the number of Datasheet Search Results displayed the feature flag disabled
    Given I disable the Feature Flag  'ProductSearchShowTotalResultCount'
    When I search the Arrow site for Product "ba"
    And I click on the Datasheet toggle in the search results
    Then I CANNOT see the number of Search Results displayed

    # updated with correct step, when on datasheet mode, it will not display the search results but it will display the data sheet count

  Scenario: Customer can see the number of Datasheet Search Results displayed the feature flag enabled
    Given I enable the Feature Flag  'ProductSearchShowTotalResultCount'
    When I search the Arrow site for Product "ba"
    And I click on the Datasheet toggle in the search results
    #Then I can see the number of Search Results displayed
    Then I can see the number of Datasheet search count

