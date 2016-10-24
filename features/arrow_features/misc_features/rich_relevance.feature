@desktop
Feature: RichRelevance

  @ARROW_1584 @full @smoke
  Scenario Outline: Rich Relevance Tags exist for Specific Pages on the Arrow Site
    Given I execute the Step "<step_name>"
    Then The Page Source contains a Rich Relevance variable of "<rr_page_type>"
    And The Page Source contains the common Rich Relevance Script

    Examples:
      | step_name                                             | rr_page_type |
      | I visit the Arrow Home Page                           | HOME         |
      | I visit the Manufacturers Detail Page            | BRAND        |
      | I visit a Part Category Landing Page             | CATEGORY     |
      | I visit the Arrow Error Page                     | ERROR        |
      | I visit a Part Detail with Multiple Cart Options | ITEM         |
#      |     TODO: Sub-Cat page |            |

  @ARROW_2850 @full @smoke
  Scenario: The Search Results Page has specific rich Relevance Tags and includes the Search Term
    Given I have searched the Arrow site for a Part with Multiple Price Tiers
    Then The Page Source contains a Rich Relevance variable of "SEARCH"
    And The Page Source contains the common Rich Relevance Script
    And The Page Source contains the Search Term in the Rich Relevance section