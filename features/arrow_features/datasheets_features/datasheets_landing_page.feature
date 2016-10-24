@desktop
Feature: DatasheetsLandingPageFeature

  @ARROW_1616 @full
  Scenario: User can see a promotion module on Datasheets Landing Page
    When I visit the Datasheets Landing Page
    And I can see Datasheet Promotion Title
    And I can see Datasheet Promotion Text
    And I can see Datasheet Promotion Button

  @full @ARROW_181
  Scenario: User can see Latest Datasheets on Datasheets Landing Page
    Given I visit the Datasheets Landing Page
    Then I can see 'Our latest Datasheets' heading
