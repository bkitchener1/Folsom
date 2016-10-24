@desktop
Feature: Cookie Policy

  @smoke @full @ARROW_3191
  Scenario: Customer requests more detail
    When I visit the Cookie Terms and Conditions page
    Then I should be able to view the full cookie policy page
