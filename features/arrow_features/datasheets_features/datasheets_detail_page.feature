@desktop
Feature: DatasheetsDetailPage

  @ARROW_1619 @full @smoke
  Scenario: The Datasheet Detail Page displays a Title
    Given I visit the Datasheets Detail page
    Then I can see a Page Title on the Datasheet Detail Page
