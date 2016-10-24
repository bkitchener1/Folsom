@desktop
@api_dependent
Feature: SearchResultAdjustableColumns
  As a User, I want to be able to add/remove columns to my Product Search results to help me choose the Product I want

  Background:
    Given I have searched the Arrow site for Product "BA"

  @ARROW_1030 @full @smoke
  Scenario: User can only see the Customise Column options when they click to Open
    Then The Customise Search Results Columns menu is NOT open
    And I Click to Customise Columns
    Then The Customise Search Results Columns menu is open

  @ARROW_1030 @full
  Scenario: Column defaults
    Then I can see the Default Search Results Columns

  @ARROW_1030 @full
  Scenario: By default all Columns are selected to view
    When I Click to Customise Columns
    Then All columns are selected on the Search Results Page

  @ARROW_1030 @full
  Scenario: User can customise the Search results Columns by de-selecting options
    And I Click to Customise Columns
    And I de-select the Search Column "Manufacturer"
    And I Click the Apply button to Customise my Search Columns
    Then I CANNOT see the Search Results Column "Manufacturer"
    When I Click to Customise Columns
    And I de-select the Search Column "Type"
    And I Click the Apply button to Customise my Search Columns
    Then I CANNOT see the Search Results Column "Type"
    Then I CANNOT see the Search Results Column "Manufacturer"

  @ARROW_1030 @full
  Scenario: User can customise the Search results Columns by re-adding columns
    And I Click to Customise Columns
    And I de-select the Search Column "Type"
    And I de-select the Search Column "Manufacturer"
    And I Click the Apply button to Customise my Search Columns
    When I Click to Customise Columns
    And I select the Search Column "Manufacturer"
    And I select the Search Column "Type"
    And I Click the Apply button to Customise my Search Columns
    Then I can see the Default Search Results Columns

  @ARROW_1030 @full
  Scenario: User cannot de-select ALL of the optional Columns
    And I Click to Customise Columns
    And I de-select the Search Column "Type"
    And I de-select the Search Column "Stock"
    And I de-select the Search Column "Description"
    And I de-select the Search Column "Manufacturer"
    And I Click the Apply button to Customise my Search Columns
    Then I see an error message that at least one option has to be selected

  @ARROW_1030 @full
  Scenario: User's can click to Cancel and the Custom Column changes are NOT applied
    And I Click to Customise Columns
    And I de-select the Search Column "Type"
    And I de-select the Search Column "Stock"
    When I Click the Cancel button in the Customise my Search Columns Panel
    Then The Customise Search Results Columns menu is NOT open
    And I can see the Default Search Results Columns

  @ARROW_1940 @full
  Scenario: User's can see extra/featured Columns when they Apply a Filter
    When I click on the "1" Search Filter Link
    Then I am directed to the Products Search Results Page
    And I can see the Default Search Results Columns
    And I can see some Extra Search Results Columns