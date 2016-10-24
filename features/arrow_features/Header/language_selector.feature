@desktop
Feature: LanguageSelector
  As a user I want a language selector so I can chose the most appropriate language

  @ARROW_1079 @full @smoke
  Scenario: The Selected Language matches up to the Language in the url
    Given I visit the Arrow Home Page
    When I click on the Language in the Header
    Then The selected Language matches the URL parameter

  @ARROW_1079 @full
  Scenario: User can change the Language using the Language selector
    Given I visit the Arrow Home Page
    When I change the site language to German
    Then I can see the Arrow site with the language parameter of "de"
    And The html contains a language attribute "de"

  @ARROW_1079 @full
  Scenario: User can select from at least 2 languages
    Given I visit the Arrow Home Page
    When I click on the Language in the Header
    Then I can see at least "2" Languages to choose from

  @BKT_798 @BKT_398 @smoke @full
  Scenario: Hreflang tag in the language setting item, English
  Given I visit the Arrow Home Page
    Then I can locate the language tracking tag for English in the source

  @BKT_798 @BKT_398 @smoke @full
  Scenario: Hreflang tag in the language setting item, German
    Given I visit the Arrow Home Page
    When I change the site language to German
    Then I can locate the language tracking tag for German in the source

  @BKT_798 @BKT_398 @smoke @full
  Scenario: Hreflang tag in the language setting item, Chinese
    Given I visit the Arrow Home Page
    When I change the site language to Chinese
    Then I can locate the language tracking tag for Chinese in the source