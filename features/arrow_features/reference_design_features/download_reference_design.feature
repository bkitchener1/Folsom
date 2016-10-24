@desktop
Feature: Download Reference Design

  @smoke @full @BKT_72
  Scenario: Customer is asked to complete CAPTCHA on downloading reference design
    Given I visit the Reference Design page
    When I download a Reference Design
    Then I am asked to complete a CAPTCHA