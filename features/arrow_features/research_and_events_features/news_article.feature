@desktop
Feature: NewsArticle

  Background:
    Given I visit the Articles Landing Page
    And I view a news item

  @smoke @full @ARROW_334
  Scenario: Customer wants to know the title of the article
    Then I will see the Title

  @smoke @full @ARROW_334
  Scenario: Customer wants to know the publish date
    Then I will see the Full date

  @smoke @full @ARROW_334
  Scenario: Customer wants to be able to filter by content tag
    Then I will see the Tags

  @smoke @full @ARROW_334
  Scenario: Customer wants to be able to add content to share or read later
    Then I will see the Add to content icon

  @smoke @full @ARROW_334
  Scenario: User wants to see main image and image caption when it's available.
    Then I will see the main image

  @smoke @full @ARROW_334
  Scenario: User wants to see article's authors
    Then  I will see the article's authors names
    And  I will see the article's authors picture
    And  I will see the article's authors company name
    And  I will see the article's authors bio
    And I will see the default written by text
