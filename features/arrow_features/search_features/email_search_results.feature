@desktop
Feature: EmailSearchResults
  As a user I want to share a Search/Filter combination via dedicated 'share this search' UI

  @BKT_380 @smoke @full
  Scenario: User Clicks 'share this search' in the Search results Page
    Given I have searched the Arrow site for Product "ba"
    Then I can see a Share This Search icon
    And The Share Search link is a correct