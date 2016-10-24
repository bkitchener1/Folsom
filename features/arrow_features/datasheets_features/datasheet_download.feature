@desktop
Feature: Download Datasheets

  @ARROW_2358 @full @smoke @ARROW_2357 @BKT_371 @prod_only
  Scenario: Customer is required to complete CAPTCHA when viewing the PDP
    When I visit a Part Detail with Datasheets
    And I download a datasheet
    Then I am asked to complete a CAPTCHA

  @ARW_405 @full @smoke @prod_only
  Scenario: Customer can download a Datasheet from the Products Search Results Page
    Given I have searched the Arrow site for Product "BAV99"
    And I click buy on the first product listing with name "BAV99"
    And I click on the Download Datasheet icon of the Search item "BAV99"
    Then I am asked to complete a CAPTCHA

  @ARW_421 @full @prod_only
  Scenario: Customer can download a Datasheet from the Featured section of the Datasheet Landing Page
    Given I visit the Datasheets Landing Page
    When I click on the Download Datasheet Button of the first Datasheet search result
    Then I am asked to complete a CAPTCHA

  @ARW_421 @full @smoke @prod_only
  Scenario: Customer can download a Datasheet from the Datasheets Search Results Page
    Given I have searched the Arrow site for Datasheet "BAV99"
    And I find the first Datasheet Item with more than 1 Related Part
    When I click on the Download Datasheet Button of the Datasheet Search item
    Then I am asked to complete a CAPTCHA
