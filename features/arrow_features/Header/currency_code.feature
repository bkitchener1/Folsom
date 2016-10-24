@desktop
Feature: CurrencyCodeFeature
  As a user I want to see the currency code so I can pay in my local currency (desktop only)

  @ARROW_153 @full
    Scenario: User can see the currency code only when they click to open
    Given I visit the Arrow Home Page
    Then The Currency text displayed in the header is "$ USD"
    Then The Currency Codes drop-down is NOT visible
    When I click on the Currency in the Header
#    Then The Currency Codes drop-down is visible
    And The default Currency Symbol is "$"
    And The default Currency Text is "USD"
    And The selected Currency Code is "USD"
    And List of foreign currency displays
    And Each Currency has a Code, Value and Currency Symbol
#    And Each Currency is shown to 2 decimal places

  @ARROW_153 @full
  Scenario: User can change the Currency Code
    Given I visit the Arrow Home Page
    And I click on the Currency in the Header
    When I select the Currency "GBP"
    Then The Currency Codes drop-down is NOT visible
    Then The Currency text displayed in the header is "£ GBP"
    When I click on the Currency in the Header
    Then The selected Currency Code is "GBP"