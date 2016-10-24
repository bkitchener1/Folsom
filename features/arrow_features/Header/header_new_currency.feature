Feature: CurrencyCodeFeature

  @desktop @smoke @full @qa_only
  Scenario: User can see the currency code only when they click to open on desktop
    Given I 'Enable' the Feature Flag  'NewHeader'
    When I visit the Arrow Home Page
    Then The Currency text displayed in the header is "$ USD"
    And The Currency drop-down is NOT visible
    When I click on the Currency in the Header
    Then The Currency Codes drop-down is visible
    And The default Currency Symbol is $
    And The default Currency Text is USD
    And A List of foreign currency displays


  @mobile @tablet @smoke @full @qa_only
  Scenario: User can see the currency code only when they click to open on mobile and tablet
    Given I 'Enable' the Feature Flag  'NewHeader'
    When I visit the Arrow Home Page
    And I click the hamburger menu in the header
    Then The Currency text displayed in the header is "$ USD"
    And The Currency drop-down is NOT visible
    When I click on the Currency in the Header
    Then The Currency Codes drop-down is visible
    And The default Currency Symbol is $
    And The default Currency Text is USD
    And A List of foreign currency displays

