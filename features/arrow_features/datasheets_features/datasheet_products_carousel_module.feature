@desktop
Feature: DatasheetProductsCarouselModule

  @ARROW_1024 @full @smoke
  Scenario: The Datasheets Detail Page has a Carousel of Products
    Given I visit the Datasheets Detail page
    Then I can see a Datasheets Products Carousel Module

  @ARROW_1024 @full
  Scenario: The Datasheets Detail Page has a Carousel of Related Products
    Given I visit the Datasheets Detail page
    Given I can see a Datasheets Products Carousel Module
    Then I can see a Title for the Slide
    And I can see a Manufacturer for the Slide
