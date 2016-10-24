@desktop
Feature: SideBarModule
  Users can see a Side bar with Navigation to Help Centre Content Pages

  @ARROW_1965 @full @smoke
    Scenario: Users can see a Side Bar Navigation throughout the Support pages
    Given I visit the FAQ Page
    Then I can see the Side Bar Navigation
    And The selected Side Nav Item is "FAQs"
