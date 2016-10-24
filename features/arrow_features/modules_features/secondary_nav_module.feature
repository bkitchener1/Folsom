
Feature: SecondaryNavigationModule

  @ARROW_1532 @full @desktop
    Scenario: The Divisional Landing Page has a Secondary Nav module with up to 5 Links
    Given I visit the Divisional Landing Page
    Then There is Secondary Navigation on the page
    And The Secondary Navigation has a Title
    And I can see up to "2" Secondary Nav Links

    @ARROW_1532 @full @mobile
      Scenario: Mobile Users can see the Secondary Nav as a Drop Down
      And I visit the Divisional Landing Page
      Then There is Secondary Navigation on the page
      And the Secondary Navigation is a dropdown
      When I click on the Main Secondary Navigation item
      Then I can see up to "2" Secondary Nav Links