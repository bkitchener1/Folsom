@desktop
Feature: DesignCenterPromotionalModule

  @ARROW_1659 @full
  Scenario: User can see the Design center Promotion on home page
    Given I visit the Arrow Home Page
    Then I can see promo section with '3' Promo Items
    And I can see the Promo Item Icon
    And I can see the Promo Item Title
    And I can see the Promo Item Description