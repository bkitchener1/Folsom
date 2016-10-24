Feature: FeaturedManufacturerModule

  @ARROW_1745 @full @smoke @desktop
  Scenario: User can see Featured Manufacturer module on Product Category page
    Given I visit a Part Category Landing Page
    Then I can see Featured Manufacture module
    And I can see Featured Manufacture Image
    And I can navigate to the featured manufacturer

  @ARROW_1745 @full @mobile
  Scenario: User can see Featured Manufacturer module on Product Category page
    Given I visit a Part Category Landing Page
    Then I can see Featured Manufacture module
    And I can see Featured Manufacture Image
    And I can navigate to the featured manufacturer

  @ARROW_1816 @full @mobile @tablet @phablet
  Scenario: User can see Featured Manufacturer module on Manufacturer Landing page on Mobile and Tablet devices
    And I visit the Manufacturers Landing Page
    Then I can see Manufacturer heading on the manufacturer landing page
    And I can see manufacturer products
    And I can see pagination link to navigate to next image

  @ARROW_1860 @full @smoke @desktop
  Scenario: User can see Featured Manufacturer module on Product Landing page on Desktop devices
    And I visit the Products Landing Page
    Then I can see Manufacturer heading on the products page
    And I can see manufacturer products

  @ARROW_1860 @full @mobile @tablet @phablet
  Scenario: User can see Featured Manufacturer module on Product Landing page on Mobile and Tablet devices
    And I visit the Products Landing Page
    Then I can see Manufacturer heading on the products page
    And I can see manufacturer products
    And I can see pagination link to navigate to next image

